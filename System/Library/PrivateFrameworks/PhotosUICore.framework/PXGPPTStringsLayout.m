@interface PXGPPTStringsLayout
- (NSArray)strings;
- (NSDictionary)attributes;
- (PXGPPTStringsLayout)init;
- (PXGPPTStringsLayout)initWithStringCount:(unint64_t)a3 localeCodes:(id)a4;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)setAttributes:(id)a3;
- (void)setStrings:(id)a3;
@end

@implementation PXGPPTStringsLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

- (void)setAttributes:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setStrings:(id)a3
{
}

- (NSArray)strings
{
  return self->_strings;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  v5 = [(PXGPPTStringsLayout *)self strings];
  v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (PXGPPTStringsLayout)initWithStringCount:(unint64_t)a3 localeCodes:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PXGPPTStringsLayout;
  v7 = [(PXGGridLayout *)&v37 init];
  v8 = v7;
  if (v7)
  {
    v29 = v7;
    v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    v10 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v11 setDay:15];
    [v11 setHour:5];
    id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v12 setDateStyle:4];
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v6;
    uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    id v30 = v6;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v32 = *(void *)v34;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v34 != v32) {
            objc_enumerationMutation(obj);
          }
          v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * v16)];
          [v12 setLocale:v17];

          for (unint64_t i = a3; i; --i)
          {
            uint64_t v19 = [v10 dateByAddingComponents:v11 toDate:v9 options:0];

            v20 = [v12 stringFromDate:v19];
            [v13 addObject:v20];

            v9 = (void *)v19;
          }
          ++v16;
        }
        while (v16 != v15);
        uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v15);
    }

    [(PXGPPTStringsLayout *)v29 setStrings:v13];
    v21 = [(PXGPPTStringsLayout *)v29 strings];
    -[PXGItemsLayout setNumberOfItems:](v29, "setNumberOfItems:", [v21 count]);

    [(PXGGridLayout *)v29 setMediaKind:3];
    [(PXGLayout *)v29 setContentSource:v29];
    v22 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v23 = (void *)[v22 mutableCopy];

    [v23 setLineBreakMode:0];
    [v23 setAlignment:1];
    v24 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    v25 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v26 = *MEMORY[0x1E4FB0700];
    v38[0] = *MEMORY[0x1E4FB06F8];
    v38[1] = v26;
    v39[0] = v24;
    v39[1] = v25;
    v38[2] = *MEMORY[0x1E4FB0738];
    v39[2] = v23;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
    [(PXGPPTStringsLayout *)v29 setAttributes:v27];

    v8 = v29;
    id v6 = v30;
  }

  return v8;
}

- (PXGPPTStringsLayout)init
{
  return [(PXGPPTStringsLayout *)self initWithStringCount:10 localeCodes:&unk_1F02D4B10];
}

@end