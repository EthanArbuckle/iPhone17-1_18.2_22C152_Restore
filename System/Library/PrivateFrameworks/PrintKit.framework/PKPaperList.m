@interface PKPaperList
+ (BOOL)supportsSecureCoding;
+ (PKPaperList)paperListWithAttrs:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4;
+ (PKPaperList)paperListWithPapers:(id)a3;
+ (PKPaperList)paperListWithTXTRecord:(id)a3;
+ (id)mediaDictFromAttrs:(id)a3 translations:(id)a4;
- (BOOL)hasMatchingLoadedRoll:(id)a3;
- (BOOL)hasMediaReady;
- (BOOL)isPaperReady:(id)a3;
- (NSArray)duplexPapers;
- (NSArray)papers;
- (NSArray)photoPapers;
- (NSArray)rolls;
- (NSArray)simplexPapers;
- (PKPaperList)initWithCoder:(id)a3;
- (PKPaperList)initWithPapers:(id)a3;
- (PKPaperList)initWithParams:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4;
- (PKPaperList)initWithTXTRecord:(id)a3;
- (id)adjustMargins:(id)a3 forDuplex:(id)a4;
- (id)availableRollPapersPreferBorderless:(BOOL)a3;
- (id)conjureMediaFromTXT:(id)a3;
- (id)debugDescription;
- (id)filterPapers:(id)a3 usingBlock:(id)a4;
- (id)filterUsingBlock:(id)a3;
- (id)matchPaper:(id)a3;
- (id)matchPaper:(id)a3 inList:(id)a4;
- (id)matchedPaper:(id)a3 preferBorderless:(BOOL)a4 withDuplexMode:(id)a5 didMatch:(BOOL *)a6;
- (id)paperListForDuplexMode:(id)a3;
- (id)papersForDocumentWithSize:(CGSize)a3 scaleUpOnRoll:(BOOL)a4 andDuplex:(BOOL)a5;
- (id)papersForPhotoWithSize:(CGSize)a3;
- (id)rollReadyPaperListForDocumentWithContentSize:(CGSize)a3 scaleUp:(BOOL)a4;
- (id)rollReadyPaperListForPhotoWithContentSize:(CGSize)a3;
- (id)rollReadyPaperListWithContentSize:(CGSize)a3 forPhoto:(BOOL)a4;
- (id)tersePaperFrom:(id)a3 withMediaInfo:(id)a4;
- (id)tersePaperFrom:(id)a3 withRequest:(id)a4;
- (unint64_t)jobTypesSupported:(id)a3;
- (void)addPaperSet:(id *)a3 withCount:(int)a4 toArrays:(id *)a5;
- (void)categorizePapers:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDuplexPapers:(id)a3;
- (void)setHasMediaReady:(BOOL)a3;
- (void)setPapers:(id)a3;
- (void)setPhotoPapers:(id)a3;
- (void)setRolls:(id)a3;
- (void)setSimplexPapers:(id)a3;
- (void)visitProperties:(Visitor *)a3;
@end

@implementation PKPaperList

+ (PKPaperList)paperListWithAttrs:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4
{
  id v5 = a4;
  v6 = [[PKPaperList alloc] initWithParams:a3 translations:v5];

  return v6;
}

- (PKPaperList)initWithParams:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PKPaperList;
  v27 = [(PKPaperList *)&v34 init];
  if (v27)
  {
    v25 = Printd_Parameters::_get_MediaColReady(&a3->var0);
    if (v25)
    {
      [(PKPaperList *)v27 setHasMediaReady:1];
    }
    else
    {
      v25 = Printd_Parameters::_get_MediaColDatabase(&a3->var0);
      [(PKPaperList *)v27 setHasMediaReady:0];
    }
    if (objc_msgSend(v25, "count", v25))
    {
      v28 = (PKPaperList *)objc_opt_new();
      v29 = (PKPaperList *)objc_opt_new();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = v26;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v31;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v31 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = [*(id *)(*((void *)&v30 + 1) + 8 * v10) collection];
            v12 = +[PKPaperList mediaDictFromAttrs:v11 translations:v6];

            v13 = +[PKPaper paperWithAttributes:v12];
            v14 = v13;
            if (v13)
            {
              int v15 = [v13 isRoll];
              v16 = v28;
              if (v15) {
                v16 = v29;
              }
              v17 = v16;
              [(PKPaperList *)v17 addObject:v14];
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v8);
      }

      BOOL v18 = [(PKPaperList *)v27 hasMediaReady];
      v19 = &selRef_sizeMediaTypeAndImageableCompare_;
      if (!v18) {
        v19 = &selRef_sizeAndImageableCompare_;
      }
      v20 = [(PKPaperList *)v28 sortedArrayUsingSelector:*v19];
      [(PKPaperList *)v27 setPapers:v20];

      v21 = (void *)[(PKPaperList *)v29 copy];
      [(PKPaperList *)v27 setRolls:v21];

      v22 = [(PKPaperList *)v27 papers];
      [(PKPaperList *)v27 categorizePapers:v22];

      v23 = v28;
    }
    else
    {
      v23 = v27;
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (PKPaperList)paperListWithPapers:(id)a3
{
  id v3 = a3;
  v4 = [[PKPaperList alloc] initWithPapers:v3];

  return v4;
}

- (PKPaperList)initWithPapers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaperList;
  id v5 = [(PKPaperList *)&v9 init];
  if (v5)
  {
    id v6 = [v4 sortedArrayUsingSelector:sel_sizeAndImageableCompare_];
    [(PKPaperList *)v5 setPapers:v6];

    id v7 = [(PKPaperList *)v5 papers];
    [(PKPaperList *)v5 categorizePapers:v7];

    [(PKPaperList *)v5 setHasMediaReady:0];
    [(PKPaperList *)v5 setRolls:MEMORY[0x263EFFA68]];
  }

  return v5;
}

+ (PKPaperList)paperListWithTXTRecord:(id)a3
{
  id v3 = a3;
  id v4 = [[PKPaperList alloc] initWithTXTRecord:v3];

  return v4;
}

- (PKPaperList)initWithTXTRecord:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaperList;
  id v5 = [(PKPaperList *)&v11 init];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(PKPaperList *)v5 conjureMediaFromTXT:v4];
    uint64_t v8 = [v7 sortedArrayUsingSelector:sel_sizeAndImageableCompare_];
    [(PKPaperList *)v6 setPapers:v8];

    objc_super v9 = [(PKPaperList *)v6 papers];
    [(PKPaperList *)v6 categorizePapers:v9];

    [(PKPaperList *)v6 setHasMediaReady:0];
    [(PKPaperList *)v6 setRolls:MEMORY[0x263EFFA68]];
  }
  return v6;
}

- (NSArray)rolls
{
  id v3 = self->_rolls;
  if (!v3)
  {
    id v4 = [(PKPaperList *)self papers];
    id v5 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_9];
    id v3 = [v4 filteredArrayUsingPredicate:v5];

    [(PKPaperList *)self setRolls:v3];
  }

  return v3;
}

uint64_t __20__PKPaperList_rolls__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRoll];
}

+ (id)mediaDictFromAttrs:(id)a3 translations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  uint64_t v8 = (void *)MEMORY[0x230FA8DB0]();
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __47__PKPaperList_mediaDictFromAttrs_translations___block_invoke;
  BOOL v18 = &unk_2649EE688;
  id v19 = &unk_26E263BA8;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  [v5 enumerateAttributes:&v15];

  if (v9)
  {
    objc_super v11 = [v10 objectForKeyedSubscript:@"media-type"];
    if (v11)
    {
      v12 = [v9 objectForKeyedSubscript:v11];
      if (v12
        || ([NSString stringWithFormat:@"media-type.%@", v11, v15, v16, v17, v18],
            v13 = objc_claimAutoreleasedReturnValue(),
            [v9 objectForKeyedSubscript:v13],
            v12 = objc_claimAutoreleasedReturnValue(),
            v13,
            v12))
      {
        [v10 setObject:v12 forKeyedSubscript:@"_vendor_media-type"];
      }
    }
  }

  return v10;
}

void __47__PKPaperList_mediaDictFromAttrs_translations___block_invoke(uint64_t a1, void *a2)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [(PK_ipp_attribute_t *)v3 name];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[PK_ipp_attribute_t value_tag](v3, "value_tag"));
    int v9 = [v7 containsObject:v8];

    if (!v9)
    {
LABEL_17:

      goto LABEL_18;
    }
    int v10 = [(PK_ipp_attribute_t *)v3 value_tag];
    objc_super v11 = 0;
    if (v10 > 53)
    {
      if (v10 != 54 && v10 != 66 && v10 != 68) {
        goto LABEL_16;
      }
      uint64_t v13 = ippGetIXString(v3, 0);
    }
    else
    {
      if (v10 != 33)
      {
        if (v10 != 51)
        {
          if (v10 == 52)
          {
            v12 = ippGetIXCollection(v3, 0);
            objc_super v11 = +[PKPaperList mediaDictFromAttrs:v12 translations:*(void *)(a1 + 40)];

            goto LABEL_14;
          }
LABEL_16:

          goto LABEL_17;
        }
        int v16 = 0;
        v14 = objc_msgSend(NSNumber, "numberWithInt:", ippGetIXRange(v3, 0, &v16));
        uint64_t v15 = [NSNumber numberWithInt:v16];
        v17[0] = v14;
        v17[1] = v15;
        objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];

LABEL_14:
        if (v11) {
          [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v6];
        }
        goto LABEL_16;
      }
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", ippGetIXInteger(v3, 0));
    }
    objc_super v11 = (void *)v13;
    goto LABEL_14;
  }
LABEL_18:
}

- (id)adjustMargins:(id)a3 forDuplex:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "paperWithMarginsAdjustedForDuplexMode:", v6, (void)v15);
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = (void *)[v7 copy];

  return v13;
}

- (BOOL)isPaperReady:(id)a3
{
  id v4 = a3;
  if ([(PKPaperList *)self hasMediaReady])
  {
    if ([(PKPaperList *)self hasMatchingLoadedRoll:v4])
    {
      BOOL v5 = 1;
    }
    else
    {
      id v6 = [(PKPaperList *)self simplexPapers];
      id v7 = [(PKPaperList *)self matchPaper:v4 inList:v6];
      BOOL v5 = v7 != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)paperListForDuplexMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && ![v4 isEqualToString:@"one-sided"])
  {
    id v7 = [(PKPaperList *)self duplexPapers];
    id v6 = [(PKPaperList *)self adjustMargins:v7 forDuplex:v5];
  }
  else
  {
    id v6 = [(PKPaperList *)self simplexPapers];
  }

  return v6;
}

- (id)papersForPhotoWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(PKPaperList *)self photoPapers];
  id v7 = [(PKPaperList *)self rolls];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8)) {
      [(PKPaperList *)self availableRollPapersPreferBorderless:1];
    }
    else {
    uint64_t v10 = -[PKPaperList rollReadyPaperListForPhotoWithContentSize:](self, "rollReadyPaperListForPhotoWithContentSize:", width, height);
    }
    if ([v10 count])
    {
      objc_super v11 = [(PKPaperList *)self photoPapers];
      uint64_t v12 = [v11 arrayByAddingObjectsFromArray:v10];

      id v6 = (void *)v12;
    }
  }

  return v6;
}

- (id)papersForDocumentWithSize:(CGSize)a3 scaleUpOnRoll:(BOOL)a4 andDuplex:(BOOL)a5
{
  BOOL v5 = a4;
  double height = a3.height;
  double width = a3.width;
  if (a5) {
    [(PKPaperList *)self duplexPapers];
  }
  else {
  uint64_t v9 = [(PKPaperList *)self simplexPapers];
  }
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8)) {
    [(PKPaperList *)self availableRollPapersPreferBorderless:0];
  }
  else {
  objc_super v11 = -[PKPaperList rollReadyPaperListForDocumentWithContentSize:scaleUp:](self, "rollReadyPaperListForDocumentWithContentSize:scaleUp:", v5, width, height);
  }
  uint64_t v12 = [v9 arrayByAddingObjectsFromArray:v11];

  return v12;
}

- (id)matchedPaper:(id)a3 preferBorderless:(BOOL)a4 withDuplexMode:(id)a5 didMatch:(BOOL *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  int v11 = [a5 isEqualToString:@"one-sided"];
  if ([(PKPaperList *)self hasMatchingLoadedRoll:v10])
  {
    id v12 = v10;
    if (v12) {
      goto LABEL_7;
    }
  }
  else
  {
    id v12 = 0;
  }
  if (v8)
  {
    uint64_t v13 = [(PKPaperList *)self photoPapers];
    id v12 = [(PKPaperList *)self matchPaper:v10 inList:v13];
  }
LABEL_7:
  if (v12) {
    goto LABEL_12;
  }
  if (v11) {
    [(PKPaperList *)self simplexPapers];
  }
  else {
  v14 = [(PKPaperList *)self duplexPapers];
  }
  id v12 = [(PKPaperList *)self matchPaper:v10 inList:v14];

  if (v12)
  {
LABEL_12:
    if (v8)
    {
      unsigned int v15 = [v12 isBorderless] ^ 1;
      if (!a6) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  if (v12)
  {
    unsigned int v15 = 0;
    if (!a6) {
      goto LABEL_15;
    }
LABEL_14:
    *a6 = v15 < 2;
    goto LABEL_15;
  }
  long long v18 = +[PKPaper genericLetterPaper];
  id v19 = [(PKPaperList *)self simplexPapers];
  id v12 = [(PKPaperList *)self matchPaper:v18 inList:v19];

  if (v12) {
    goto LABEL_23;
  }
  uint64_t v20 = +[PKPaper genericA4Paper];
  id v21 = [(PKPaperList *)self simplexPapers];
  id v12 = [(PKPaperList *)self matchPaper:v20 inList:v21];

  if (v12)
  {
LABEL_23:
    unsigned int v15 = 3;
    if (a6) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v22 = +[PKPaper genericLetterPaper];
    unsigned int v15 = 3;
    id v12 = (id)v22;
    if (a6) {
      goto LABEL_14;
    }
  }
LABEL_15:
  long long v16 = [(PKPaperList *)self tersePaperFrom:v12 withRequest:v10];

  return v16;
}

- (void)addPaperSet:(id *)a3 withCount:(int)a4 toArrays:(id *)a5
{
  if ((a4 - 1) <= 2)
  {
    uint64_t v16 = v7;
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    uint64_t v13 = (int *)((char *)&-[PKPaperList addPaperSet:withCount:toArrays:]::paperMap + 12 * (a4 - 1));
    if (a4 == 2 && ![a3[1] isBorderless]) {
      uint64_t v13 = (int *)&-[PKPaperList addPaperSet:withCount:toArrays:]::paperMapAlt;
    }
    objc_msgSend(*a5, "addObject:", a3[*v13], v8, v16, v17, v18, v9);
    [a5[1] addObject:a3[v13[1]]];
    id v14 = a5[2];
    id v15 = a3[v13[2]];
    [v14 addObject:v15];
  }
}

- (void)categorizePapers:(id)a3
{
  v50[1] = *(id *)MEMORY[0x263EF8340];
  v48 = 0;
  id v49 = 0;
  v50[0] = 0;
  uint64_t v46 = [MEMORY[0x263EFF980] arrayWithCapacity:0];

  uint64_t v45 = [MEMORY[0x263EFF980] arrayWithCapacity:0];

  uint64_t v47 = [MEMORY[0x263EFF980] arrayWithCapacity:0];

  BOOL v4 = [(PKPaperList *)self hasMediaReady];
  BOOL v5 = v4;
  uint64_t v6 = &unk_26E265168;
  if (v4) {
    uint64_t v6 = &unk_26E265150;
  }
  v39 = v6;
  if (v4) {
    uint64_t v7 = &__block_literal_global_90;
  }
  else {
    uint64_t v7 = &__block_literal_global_95;
  }
  context = (void *)MEMORY[0x230FA8DB0]();
  uint64_t v8 = v48;
  v48 = 0;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [(PKPaperList *)self papers];
  uint64_t v9 = 0;
  uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    if (v5) {
      id v12 = &__block_literal_global_90;
    }
    else {
      id v12 = &__block_literal_global_95;
    }
    uint64_t v13 = (unsigned int (*)(void *, void *, void *))v12[2];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
        if (!v13(v7, v15, v48))
        {
          -[PKPaperList addPaperSet:withCount:toArrays:](self, "addPaperSet:withCount:toArrays:", &v48, v9, &v45, context);
          v28 = [(PKPaperList *)self tersePaperFrom:v15 withMediaInfo:v39];
          if (v28)
          {
            uint64_t v29 = [(PKPaperList *)self tersePaperFrom:v15 withMediaInfo:v39];
            long long v30 = v48;
            v48 = (void *)v29;

            id v31 = v50[0];
            v50[0] = 0;

            id v32 = v50[0];
            long long v33 = v49;
            id v49 = v32;
            uint64_t v9 = 1;
          }
          else
          {
            uint64_t v9 = 0;
            long long v33 = v48;
            v48 = 0;
          }

          goto LABEL_24;
        }
        if ((int)v9 >= 1)
        {
          [v15 imageableAreaRect];
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          [*(&v48 + (v9 - 1)) imageableAreaRect];
          v52.origin.x = v24;
          v52.origin.y = v25;
          v52.size.double width = v26;
          v52.size.double height = v27;
          v51.origin.x = v17;
          v51.origin.y = v19;
          v51.size.double width = v21;
          v51.size.double height = v23;
          if (!CGRectEqualToRect(v51, v52))
          {
            v28 = [(PKPaperList *)self tersePaperFrom:v15 withMediaInfo:v39];
            if (v28)
            {
              if (v9 > 2)
              {
                objc_storeStrong(v50, v28);
              }
              else
              {
                objc_storeStrong(&v48 + v9, v28);
                uint64_t v9 = (v9 + 1);
              }
            }
LABEL_24:
          }
        }
        ++v14;
      }
      while (v10 != v14);
      uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      uint64_t v10 = v34;
    }
    while (v34);
  }

  [(PKPaperList *)self addPaperSet:&v48 withCount:v9 toArrays:&v45];
  [(PKPaperList *)self setSimplexPapers:v46];
  [(PKPaperList *)self setDuplexPapers:v45];
  [(PKPaperList *)self setPhotoPapers:v47];
  for (uint64_t i = 16; i != -8; i -= 8)

  for (uint64_t j = 16; j != -8; j -= 8)
}

uint64_t __32__PKPaperList_categorizePapers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualSizeAndMediaType:");
}

uint64_t __32__PKPaperList_categorizePapers___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualSize:");
}

- (id)tersePaperFrom:(id)a3 withRequest:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
    uint64_t v8 = [v5 mediaInfo];
    double v20 = [v6 mediaInfo];
    CGFloat v19 = [MEMORY[0x263EFF980] arrayWithArray:&unk_26E265180];
    uint64_t v9 = [v20 objectForKeyedSubscript:@"media-type"];

    if (v9) {
      [v19 addObject:@"media-type"];
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v19;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v15 = [v8 objectForKeyedSubscript:v14];
          if (v15) {
            [v7 setObject:v15 forKeyedSubscript:v14];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    double v16 = +[PKPaper paperWithAttributes:v7];
    if ([v5 isRoll])
    {
      uint64_t v17 = objc_msgSend(v16, "cutToPWGLength:", objc_msgSend(v6, "height"));

      double v16 = (void *)v17;
    }
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (id)tersePaperFrom:(id)a3 withMediaInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  uint64_t v8 = [v5 mediaInfo];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v18);
        if (v14) {
          [v7 setObject:v14 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ([v9 containsObject:@"media-type"])
  {
    id v15 = [v8 objectForKeyedSubscript:@"_vendor_media-type"];
    [v7 setObject:v15 forKeyedSubscript:@"_vendor_media-type"];
  }
  double v16 = +[PKPaper paperWithAttributes:](PKPaper, "paperWithAttributes:", v7, (void)v18);

  return v16;
}

- (id)rollReadyPaperListWithContentSize:(CGSize)a3 forPhoto:(BOOL)a4
{
  if (a4) {
    -[PKPaperList rollReadyPaperListForPhotoWithContentSize:](self, "rollReadyPaperListForPhotoWithContentSize:", a3.width, a3.height);
  }
  else {
  BOOL v4 = [(PKPaperList *)self rollReadyPaperListForDocumentWithContentSize:a3.width scaleUp:a3.height];
  }

  return v4;
}

- (id)rollReadyPaperListForDocumentWithContentSize:(CGSize)a3 scaleUp:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v7 = -[PKPaperList rollReadyPaperListForPhotoWithContentSize:](self, "rollReadyPaperListForPhotoWithContentSize:", a3.width, a3.height);
    goto LABEL_23;
  }
  uint64_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  [(PKPaperList *)self availableRollPapersPreferBorderless:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v9) {
    goto LABEL_22;
  }
  uint64_t v10 = *(void *)v22;
  if (width >= height) {
    double v11 = height;
  }
  else {
    double v11 = width;
  }
  if (width >= height) {
    double v12 = width;
  }
  else {
    double v12 = height;
  }
  int v13 = (int)v12;
  int v14 = (int)v11;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v8);
      }
      double v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      objc_msgSend(v16, "paperSize", (void)v21);
      int v18 = v14;
      if (v17 < (double)v13)
      {
        int v18 = v13;
        if (v17 < (double)v14)
        {
          if (width <= 0.0) {
            continue;
          }
          int v18 = vcvtpd_s64_f64(height * (v17 / width));
        }
      }
      if (v18 >= 1)
      {
        long long v19 = [v16 cutToLength:(double)v18];
        [v7 addObject:v19];
      }
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v9);
LABEL_22:

LABEL_23:

  return v7;
}

- (id)rollReadyPaperListForPhotoWithContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  [(PKPaperList *)self availableRollPapersPreferBorderless:1];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    double v10 = width / height;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "width", (void)v20);
        int v14 = [v12 leftMargin];
        double v15 = (double)(int)(v13 - (v14 + [v12 rightMargin]));
        double v16 = objc_msgSend(v12, "cutToPWGLength:", objc_msgSend(v12, "topMargin")+ objc_msgSend(v12, "bottomMargin")+ vcvtmd_s64_f64(v15 / v10));
        [v6 addObject:v16];
        double v17 = objc_msgSend(v12, "cutToPWGLength:", objc_msgSend(v12, "topMargin")+ objc_msgSend(v12, "bottomMargin")+ vcvtmd_s64_f64(v10 * v15));
        int v18 = [v17 height];
        if (v18 != [v16 height]) {
          [v6 addObject:v17];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)availableRollPapersPreferBorderless:(BOOL)a3
{
  int v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  id v6 = [(PKPaperList *)self rolls];
  id v7 = (void *)[v6 copy];

  if (![v7 count]) {
    goto LABEL_21;
  }
  id v8 = (id)[v7 sortedArrayUsingComparator:&__block_literal_global_104];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v10)
  {

    id v11 = 0;
    goto LABEL_20;
  }
  id v11 = 0;
  uint64_t v12 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      int v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (v11)
      {
        int v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "width", (void)v19);
        if (v15 == [v11 width]
          && (int v16 = [v14 height], v16 == objc_msgSend(v11, "height")))
        {
          if ([v14 isBorderless] != v3) {
            continue;
          }
          id v17 = v14;
        }
        else
        {
          [v5 addObject:v11];
          id v17 = v14;
        }
        id v11 = v17;
      }
      else
      {
        id v11 = v14;
      }
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v10);

  if (v11) {
    [v5 addObject:v11];
  }
LABEL_20:

LABEL_21:

  return v5;
}

uint64_t __51__PKPaperList_availableRollPapersPreferBorderless___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  LODWORD(v5) = [v6 width];
  if ((int)v5 > (int)[v7 width]) {
    goto LABEL_2;
  }
  int v9 = [v6 width];
  if (v9 < (int)[v7 width])
  {
    uint64_t v8 = -1;
    goto LABEL_9;
  }
  int v10 = [v6 height];
  if (v10 > (int)[v7 height])
  {
LABEL_2:
    uint64_t v8 = 1;
  }
  else
  {
    int v11 = [v6 height];
    if (v11 >= (int)[v7 height]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = -1;
    }
  }
LABEL_9:

  return v8;
}

- (id)matchPaper:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __26__PKPaperList_matchPaper___block_invoke;
  v8[3] = &unk_2649EE6F0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(PKPaperList *)self filterUsingBlock:v8];

  return v6;
}

uint64_t __26__PKPaperList_matchPaper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) width];
  if (v4 == [v3 width]
    && (int v5 = [*(id *)(a1 + 32) height], v5 == objc_msgSend(v3, "height")))
  {
    id v6 = [*(id *)(a1 + 32) mediaType];
    if ([v6 isEqualToString:&stru_26E251B90])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 32) mediaType];
      id v9 = [v3 mediaType];
      uint64_t v7 = [v8 isEqualToString:v9];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)matchPaper:(id)a3 inList:(id)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__PKPaperList_matchPaper_inList___block_invoke;
  v11[3] = &unk_2649EE6F0;
  id v7 = v6;
  id v12 = v7;
  uint64_t v8 = [(PKPaperList *)self filterPapers:a4 usingBlock:v11];
  if ([v8 count])
  {
    id v9 = [v8 objectAtIndexedSubscript:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __33__PKPaperList_matchPaper_inList___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) width];
  if (v4 == [v3 width]
    && (int v5 = [*(id *)(a1 + 32) height], v5 == objc_msgSend(v3, "height")))
  {
    id v6 = [*(id *)(a1 + 32) mediaType];
    if ([v6 isEqualToString:&stru_26E251B90])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 32) mediaType];
      id v9 = [v3 mediaType];
      uint64_t v7 = [v8 isEqualToString:v9];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)hasMatchingLoadedRoll:(id)a3
{
  id v4 = a3;
  if ([v4 isRoll])
  {
    int v5 = [(PKPaperList *)self rolls];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __37__PKPaperList_hasMatchingLoadedRoll___block_invoke;
    v9[3] = &unk_2649EE718;
    id v10 = v4;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v9];

    BOOL v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

BOOL __37__PKPaperList_hasMatchingLoadedRoll___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 width];
  BOOL v5 = v4 == [*(id *)(a1 + 32) width];

  return v5;
}

- (id)filterUsingBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPaperList *)self papers];
  uint64_t v6 = [(PKPaperList *)self filterPapers:v5 usingBlock:v4];

  return v6;
}

- (id)filterPapers:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x263F08A98];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__PKPaperList_filterPapers_usingBlock___block_invoke;
  v12[3] = &unk_2649EE740;
  id v8 = v6;
  id v13 = v8;
  id v9 = [v7 predicateWithBlock:v12];
  id v10 = [v5 filteredArrayUsingPredicate:v9];

  return v10;
}

uint64_t __39__PKPaperList_filterPapers_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)jobTypesSupported:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v10 = [a3 objectForKeyedSubscript:@"kind"];
  [v10 componentsSeparatedByString:@","];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 caseInsensitiveCompare:@"document"])
        {
          if ([v8 caseInsensitiveCompare:@"envelope"])
          {
            if ([v8 caseInsensitiveCompare:@"label"])
            {
              if ([v8 caseInsensitiveCompare:@"photo"])
              {
                if ([v8 caseInsensitiveCompare:@"receipt"])
                {
                  if (![v8 caseInsensitiveCompare:@"roll"]) {
                    v4 |= 0x20uLL;
                  }
                }
                else
                {
                  v4 |= 0x10uLL;
                }
              }
              else
              {
                v4 |= 8uLL;
              }
            }
            else
            {
              v4 |= 4uLL;
            }
          }
          else
          {
            v4 |= 2uLL;
          }
        }
        else
        {
          v4 |= 1uLL;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v4;
}

- (id)conjureMediaFromTXT:(id)a3
{
  v38[2] = *MEMORY[0x263EF8340];
  id v18 = a3;
  unint64_t v4 = _PKLogCategory(PKLogCategoryFramework);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22EA54000, v4, OS_LOG_TYPE_DEFAULT, "Defaulting to generic media size values.", buf, 2u);
  }

  uint64_t v16 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  id v31 = +[PKPaper genericA4Paper];
  long long v30 = +[PKPaper genericLetterPaper];
  uint64_t v29 = +[PKPaper generic4x6Paper];
  v28 = +[PKPaper genericWithName:@"na_index-4x6_4x6in"];
  CGFloat v27 = +[PKPaper genericA6Paper];
  uint64_t v26 = +[PKPaper genericWithName:@"iso_a6_105x148mm"];
  uint64_t v25 = +[PKPaper generic3_5x5Paper];
  uint64_t v24 = +[PKPaper genericWithName:@"oe_photo-l_3.5x5in"];
  long long v23 = +[PKPaper genericBorderlessWithName:@"na_5x7_5x7in"];
  long long v22 = +[PKPaper genericWithName:@"na_5x7_5x7in"];
  long long v21 = +[PKPaper genericWithName:@"na_number-10_4.125x9.5in"];
  long long v20 = +[PKPaper genericWithName:@"iso_dl_110x220mm"];
  long long v19 = +[PKPaper genericWithName:@"jpn_chou3_120x235mm"];
  uint64_t v5 = +[PKPaper genericWithName:@"jpn_chou4_90x205mm"];
  id v17 = +[PKPaper genericLegalPaper];
  uint64_t v6 = [v18 objectForKeyedSubscript:@"product"];
  unint64_t v7 = [(PKPaperList *)self jobTypesSupported:v18];
  char v8 = v7;
  if (!v7)
  {
    if (v6)
    {
      if ([v6 rangeOfString:@"Photosmart"] != 0x7FFFFFFFFFFFFFFFLL
        || [v6 rangeOfString:@"Officejet"] != 0x7FFFFFFFFFFFFFFFLL
        || [v6 rangeOfString:@"Deskjet"] != 0x7FFFFFFFFFFFFFFFLL
        || [v6 rangeOfString:@"ENVY"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v35[0] = v31;
        v35[1] = v30;
        v35[2] = v28;
        v35[3] = v29;
        v35[4] = v26;
        v35[5] = v27;
        v35[6] = v24;
        v35[7] = v25;
        v35[8] = v22;
        v35[9] = v23;
        v35[10] = v21;
        v35[11] = v20;
        v35[12] = v19;
        v35[13] = v5;
        v35[14] = v17;
        long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:15];
        [v16 addObjectsFromArray:v14];
        goto LABEL_24;
      }
      if ([v6 rangeOfString:@"EPSON WF"] != 0x7FFFFFFFFFFFFFFFLL
        || [v6 rangeOfString:@"EPSON WorkForce"] != 0x7FFFFFFFFFFFFFFFLL
        || [v6 rangeOfString:@"EPSON Stylus"] != 0x7FFFFFFFFFFFFFFFLL
        || [v6 rangeOfString:@"EPSON Artisan"] != 0x7FFFFFFFFFFFFFFFLL
        || [v6 rangeOfString:@"EPSON XP"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v34[0] = v31;
        v34[1] = v30;
        v34[2] = v28;
        v34[3] = v29;
        v34[4] = v26;
        v34[5] = v27;
        v34[6] = v24;
        v34[7] = v25;
        v34[8] = v22;
        v34[9] = v23;
        v34[10] = v21;
        v34[11] = v17;
        long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:12];
        [v16 addObjectsFromArray:v14];
        goto LABEL_24;
      }
    }
    v33[0] = v30;
    v33[1] = v31;
    v33[2] = v29;
    v33[3] = v27;
    v33[4] = v25;
    long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:5];
    [v16 addObjectsFromArray:v14];
LABEL_24:

    goto LABEL_25;
  }
  if (v7)
  {
    v38[0] = v31;
    v38[1] = v30;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
    [v16 addObjectsFromArray:v9];
  }
  if ((v8 & 8) != 0)
  {
    v37[0] = v28;
    v37[1] = v29;
    v37[2] = v26;
    v37[3] = v27;
    v37[4] = v24;
    v37[5] = v25;
    v37[6] = v22;
    v37[7] = v23;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:8];
    [v16 addObjectsFromArray:v10];
  }
  if ((v8 & 2) != 0)
  {
    v36[0] = v21;
    v36[1] = v20;
    v36[2] = v19;
    v36[3] = v5;
    long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
    [v16 addObjectsFromArray:v11];
  }
  long long v12 = [v18 objectForKeyedSubscript:@"papermax"];
  BOOL v13 = [v12 caseInsensitiveCompare:@"legal-A4"] == 0;

  if (!v13) {
    [v16 addObject:v17];
  }
LABEL_25:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaperList)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaperList;
  uint64_t v5 = [(PKPaperList *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    DecodeVisitor::visitProperties(v5, v4);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)visitProperties:(Visitor *)a3
{
  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, __CFString *, BOOL *))a3->var0 + 3))(a3, @"hasMediaReady", &self->_hasMediaReady);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 23))(a3, @"papers", &self->_papers);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 23))(a3, @"simplexPapers", &self->_simplexPapers);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 23))(a3, @"duplexPapers", &self->_duplexPapers);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 23))(a3, @"photoPapers", &self->_photoPapers);
  (*((void (**)(Visitor *, __CFString *, NSArray **))a3->var0 + 23))(a3, @"rolls", &self->_rolls);
  uint64_t v5 = (void (*)(Visitor *))*((void *)a3->var0 + 24);

  v5(a3);
}

- (id)debugDescription
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__3;
  id v9 = __Block_byref_object_dispose__3;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__PKPaperList_debugDescription__block_invoke;
  v4[3] = &unk_2649EE578;
  v4[4] = self;
  v4[5] = &v5;
  DescVisitor::visitProperties(self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __31__PKPaperList_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = NSString;
  id v10 = [*(id *)(a1 + 32) description];
  uint64_t v5 = (*(void (**)(uint64_t))(*(void *)a2 + 208))(a2);
  uint64_t v6 = (*(void (**)(uint64_t))(*(void *)a2 + 200))(a2);
  uint64_t v7 = [v4 stringWithFormat:@"%@ Encoded classes: %@, properties %@", v10, v5, v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (BOOL)hasMediaReady
{
  return self->_hasMediaReady;
}

- (void)setHasMediaReady:(BOOL)a3
{
  self->_hasMediaReady = a3;
}

- (NSArray)papers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPapers:(id)a3
{
}

- (NSArray)simplexPapers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSimplexPapers:(id)a3
{
}

- (NSArray)duplexPapers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDuplexPapers:(id)a3
{
}

- (NSArray)photoPapers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPhotoPapers:(id)a3
{
}

- (void)setRolls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolls, 0);
  objc_storeStrong((id *)&self->_photoPapers, 0);
  objc_storeStrong((id *)&self->_duplexPapers, 0);
  objc_storeStrong((id *)&self->_simplexPapers, 0);

  objc_storeStrong((id *)&self->_papers, 0);
}

@end