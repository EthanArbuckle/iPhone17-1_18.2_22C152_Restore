@interface NSTextRange
+ (id)combineTextRanges:(id)a3 withTextRanges:(id)a4 usingOperator:(int)a5;
- (BOOL)containsLocation:(id)location;
- (BOOL)containsRange:(NSTextRange *)textRange;
- (BOOL)intersectsWithTextRange:(NSTextRange *)textRange;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextRange:(NSTextRange *)textRange;
- (BOOL)isNotEmpty;
- (NSTextRange)initWithLocation:(id)location;
- (NSTextRange)initWithLocation:(id)location endLocation:(id)endLocation;
- (NSTextRange)textRangeByFormingUnionWithTextRange:(NSTextRange *)textRange;
- (NSTextRange)textRangeByIntersectingWithTextRange:(NSTextRange *)textRange;
- (NSTextRange)textRangeWithAdjustment:(unint64_t)a3 rangeProvider:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)endLocation;
- (id)location;
- (void)dealloc;
@end

@implementation NSTextRange

- (id)location
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)endLocation
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSTextRange)initWithLocation:(id)location endLocation:(id)endLocation
{
  if (initWithLocation_endLocation__onceToken != -1)
  {
    dispatch_once(&initWithLocation_endLocation__onceToken, &__block_literal_global_16);
    if (location) {
      goto LABEL_3;
    }
LABEL_21:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextRange.m", 26, @"attempt to create %@ from nil location", objc_opt_class(), v14, v15);
    goto LABEL_22;
  }
  if (!location) {
    goto LABEL_21;
  }
LABEL_3:
  if (!endLocation || [location compare:endLocation] != 1)
  {
    if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass())
    {
      if (!endLocation)
      {
        uint64_t v9 = [location characterIndex];
        uint64_t v8 = v9;
        goto LABEL_12;
      }
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [location characterIndex];
        uint64_t v9 = [endLocation characterIndex];
LABEL_12:
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v8, v9 - v8);

          return &v10->super;
        }
      }
    }
    v16.receiver = self;
    v16.super_class = (Class)NSTextRange;
    v12 = [(NSTextRange *)&v16 init];
    if (v12)
    {
      v12->_location = (NSTextLocation *)location;
      if (endLocation) {
        id v13 = endLocation;
      }
      else {
        id v13 = location;
      }
      v12->_endLocation = (NSTextLocation *)v13;
    }
    return v12;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextRange.m", 32, @"attempt to create backwards %@ from %@ to %@", objc_opt_class(), location, endLocation);
LABEL_22:

  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextRange;
  [(NSTextRange *)&v3 dealloc];
}

- (NSTextRange)initWithLocation:(id)location
{
  return [(NSTextRange *)self initWithLocation:location endLocation:0];
}

- (BOOL)containsRange:(NSTextRange *)textRange
{
  BOOL v5 = [(NSTextRange *)self containsLocation:[(NSTextRange *)textRange location]];
  if (v5) {
    LOBYTE(v5) = objc_msgSend(-[NSTextRange endLocation](textRange, "endLocation"), "compare:", -[NSTextRange endLocation](self, "endLocation")) != 1;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(NSTextRange *)self isEqualToTextRange:a3];
}

- (NSTextRange)textRangeWithAdjustment:(unint64_t)a3 rangeProvider:(id)a4
{
  v7 = self;
  if ((a3 & 3) == 0) {
    goto LABEL_9;
  }
  if ((a3 & 3) == 3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextRange.m", 159, @"Only one of (NSTextRangeAdjustmentHeadForward|NSTextRangeAdjustmentHeadBackward) should be specified.");
  }
  id v8 = [(NSTextRange *)v7 location];
  uint64_t v9 = (void *)(*((uint64_t (**)(id, id, BOOL))a4 + 2))(a4, v8, (a3 & 2) == 0);
  uint64_t v10 = (uint64_t)v9;
  if (v9)
  {
    v11 = (void *)[v9 location];
    uint64_t v12 = (uint64_t)v11;
    if ((a3 & 2) == 0) {
      goto LABEL_8;
    }
    if ([v11 compare:v8] == -1)
    {
      uint64_t v12 = [(id)v10 endLocation];
LABEL_8:
      if ([v8 compare:v12] == -1)
      {
        uint64_t v10 = [(id)v10 location];
        goto LABEL_10;
      }
    }
LABEL_9:
    uint64_t v10 = 0;
  }
LABEL_10:
  if ((a3 & 0xC) == 0) {
    goto LABEL_19;
  }
  if ((a3 & 0xC) == 0xC) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"NSTextRange.m", 181, @"Only one of (NSTextRangeAdjustmentTailForward|NSTextRangeAdjustmentTailBackward) should be specified.");
  }
  uint64_t v13 = [(NSTextRange *)v7 endLocation];
  uint64_t v14 = (void *)(*((uint64_t (**)(id, uint64_t, unint64_t))a4 + 2))(a4, v13, (a3 >> 2) & 1);
  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v15 = v14;
  if ((a3 & 4) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(v14, "location"), "compare:", v13) != -1)
    {
LABEL_19:
      uint64_t v18 = 0;
      goto LABEL_20;
    }
    uint64_t v16 = [v15 endLocation];
    v17 = (void *)v13;
  }
  else
  {
    v17 = (void *)[v14 endLocation];
    uint64_t v16 = v13;
  }
  if ([v17 compare:v16] != -1) {
    goto LABEL_19;
  }
  uint64_t v18 = [v15 endLocation];
LABEL_20:
  if (!(v10 | v18)) {
    return v7;
  }
  if (v10)
  {
    if (v18) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v10 = [(NSTextRange *)v7 location];
    if (v18) {
      goto LABEL_23;
    }
  }
  uint64_t v18 = [(NSTextRange *)v7 endLocation];
LABEL_23:
  if ([(id)v18 compare:v10] == -1) {
    return 0;
  }
  v19 = [[NSTextRange alloc] initWithLocation:v10 endLocation:v18];

  return v19;
}

uint64_t __44__NSTextRange_initWithLocation_endLocation___block_invoke()
{
  initWithLocation_endLocation__countableTextLocationClass = objc_opt_class();
  uint64_t result = objc_opt_class();
  initWithLocation_endLocation__countableTextRangeClass = result;
  return result;
}

- (BOOL)isEmpty
{
  id v3 = [(NSTextRange *)self location];
  id v4 = [(NSTextRange *)self endLocation];

  return [v3 isEqual:v4];
}

- (BOOL)isNotEmpty
{
  return objc_msgSend(-[NSTextRange location](self, "location"), "isEqual:", -[NSTextRange endLocation](self, "endLocation")) ^ 1;
}

- (BOOL)isEqualToTextRange:(NSTextRange *)textRange
{
  int v5 = objc_msgSend(-[NSTextRange location](self, "location"), "isEqual:", -[NSTextRange location](textRange, "location"));
  if (v5)
  {
    id v6 = [(NSTextRange *)self endLocation];
    id v7 = [(NSTextRange *)textRange endLocation];
    LOBYTE(v5) = [v6 isEqual:v7];
  }
  return v5;
}

- (BOOL)containsLocation:(id)location
{
  return ![(NSTextRange *)self isEmpty]
      && objc_msgSend(-[NSTextRange location](self, "location"), "compare:", location) != 1
      && objc_msgSend(location, "compare:", -[NSTextRange endLocation](self, "endLocation")) == -1;
}

- (BOOL)intersectsWithTextRange:(NSTextRange *)textRange
{
  return ![(NSTextRange *)self isEmpty]
      && ![(NSTextRange *)textRange isEmpty]
      && objc_msgSend(-[NSTextRange location](textRange, "location"), "compare:", -[NSTextRange endLocation](self, "endLocation")) == -1&& objc_msgSend(-[NSTextRange location](self, "location"), "compare:", -[NSTextRange endLocation](textRange, "endLocation")) == -1;
}

- (NSTextRange)textRangeByIntersectingWithTextRange:(NSTextRange *)textRange
{
  if (!textRange) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextRange.m", 103, @"Invalid parameter not satisfying: %@", @"range");
  }
  if ([(NSTextRange *)self isEmpty]
    && [(NSTextRange *)textRange containsLocation:[(NSTextRange *)self location]])
  {
    goto LABEL_19;
  }
  if ([(NSTextRange *)textRange isEmpty]
    && [(NSTextRange *)self containsLocation:[(NSTextRange *)textRange location]])
  {
    goto LABEL_7;
  }
  if ([(NSTextRange *)self isEmpty] || [(NSTextRange *)textRange isEmpty]) {
    return 0;
  }
  id v7 = [(NSTextRange *)self location];
  id v8 = [(NSTextRange *)self endLocation];
  id v9 = [(NSTextRange *)textRange location];
  id v10 = [(NSTextRange *)textRange endLocation];
  id v11 = [v7 compare:v9] == -1 ? v9 : v7;
  id v12 = [v10 compare:v8] == -1 ? v10 : v8;
  if (v7 == v11 && v8 == v12)
  {
LABEL_19:
    int v5 = self;
    goto LABEL_20;
  }
  if (v9 != v11 || v10 != v12)
  {
    if ([v11 compare:v12] == -1)
    {
      int v5 = (NSTextRange *)[objc_alloc((Class)objc_opt_class()) initWithLocation:v11 endLocation:v12];
      goto LABEL_20;
    }
    return 0;
  }
LABEL_7:
  int v5 = textRange;
LABEL_20:

  return v5;
}

- (NSTextRange)textRangeByFormingUnionWithTextRange:(NSTextRange *)textRange
{
  if ([(NSTextRange *)self isEmpty]) {
    goto LABEL_2;
  }
  if ([(NSTextRange *)textRange isEmpty]) {
    goto LABEL_13;
  }
  id v6 = [(NSTextRange *)self location];
  id v7 = [(NSTextRange *)self endLocation];
  id v8 = [(NSTextRange *)textRange location];
  id v9 = [(NSTextRange *)textRange endLocation];
  if ([v8 compare:v6] == -1) {
    id v10 = v8;
  }
  else {
    id v10 = v6;
  }
  if ([v7 compare:v9] == -1) {
    id v11 = v9;
  }
  else {
    id v11 = v7;
  }
  if ([v10 compare:v11] != -1) {
    -[NSTextRange textRangeByFormingUnionWithTextRange:]();
  }
  if (v6 == v10 && v7 == v11)
  {
LABEL_13:
    int v5 = self;
  }
  else
  {
    if (v8 == v10 && v9 == v11)
    {
LABEL_2:
      int v5 = textRange;
      goto LABEL_14;
    }
    int v5 = (NSTextRange *)[objc_alloc((Class)objc_opt_class()) initWithLocation:v10 endLocation:v11];
  }
LABEL_14:

  return v5;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, -[NSTextRange description](self, "description")];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@...%@", objc_msgSend(-[NSTextRange location](self, "location"), "description"), objc_msgSend(-[NSTextRange endLocation](self, "endLocation"), "description")];
}

+ (id)combineTextRanges:(id)a3 withTextRanges:(id)a4 usingOperator:(int)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (![a3 count]
    || [a3 count] == 1 && objc_msgSend((id)objc_msgSend(a3, "firstObject"), "isEmpty"))
  {
    if ((a5 & 2) != 0) {
      return a4;
    }
    else {
      return 0;
    }
  }
  if (![a4 count]
    || [a4 count] == 1 && objc_msgSend((id)objc_msgSend(a4, "firstObject"), "isEmpty"))
  {
    if (a5) {
      return a3;
    }
    else {
      return 0;
    }
  }
  uint64_t v9 = [a3 count];
  uint64_t v38 = [a4 count];
  uint64_t v43 = v38 + v9;
  size_t v10 = 48 * (v38 + v9);
  unint64_t v41 = v10;
  if (v10 < 0x181) {
    __base = &v55;
  }
  else {
    __base = (char *)malloc_type_malloc(v10, 0x10800402F72B0F7uLL);
  }
  int v42 = a5;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v54, 16, v38, v9);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v50;
    do
    {
      uint64_t v15 = 0;
      uint64_t v16 = &__base[24 * v13];
      v13 += 2 * v12;
      do
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(a3);
        }
        v17 = *(void **)(*((void *)&v49 + 1) + 8 * v15);
        *(void *)uint64_t v16 = [v17 location];
        *((_DWORD *)v16 + 2) = 0;
        v16[12] = 1;
        *((void *)v16 + 2) = 0;
        *((void *)v16 + 3) = [v17 endLocation];
        *((_DWORD *)v16 + 8) = 0;
        v16[36] = 0;
        *((void *)v16 + 5) = v17;
        ++v15;
        v16 += 48;
      }
      while (v12 != v15);
      uint64_t v12 = [a3 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  size_t v18 = 2 * v43;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v19 = [a4 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      uint64_t v22 = 0;
      v23 = &__base[24 * v13];
      v13 += 2 * v20;
      do
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(a4);
        }
        v24 = *(void **)(*((void *)&v45 + 1) + 8 * v22);
        *(void *)v23 = [v24 location];
        *((_DWORD *)v23 + 2) = 1;
        v23[12] = 1;
        *((void *)v23 + 2) = 0;
        *((void *)v23 + 3) = [v24 endLocation];
        *((_DWORD *)v23 + 8) = 1;
        v23[36] = 0;
        *((void *)v23 + 5) = v24;
        ++v22;
        v23 += 48;
      }
      while (v20 != v22);
      uint64_t v20 = [a4 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v20);
  }
  if (v13 != v18) {
    +[NSTextRange combineTextRanges:withTextRanges:usingOperator:].cold.5();
  }
  qsort_b(__base, v18, 0x18uLL, &__block_literal_global_38_0);
  v25 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v18)
  {
    char v26 = 0;
    BOOL v27 = 0;
    BOOL v28 = 0;
    id v29 = 0;
    uint64_t v30 = 0;
    v31 = __base;
    while (1)
    {
      if (*((_DWORD *)v31 + 2)) {
        BOOL v27 = v31[12] != 0;
      }
      else {
        BOOL v28 = v31[12] != 0;
      }
      if (++v30 < v18 && ![*(id *)v31 compare:*((void *)v31 + 3)]) {
        goto LABEL_60;
      }
      if (v28 || v27) {
        break;
      }
      if (v26) {
        goto LABEL_51;
      }
LABEL_59:
      char v26 = 0;
LABEL_60:
      v31 += 24;
      if (2 * v39 + 2 * v40 == v30)
      {
        if (v29) {
          +[NSTextRange combineTextRanges:withTextRanges:usingOperator:]();
        }
        if (v26) {
          +[NSTextRange combineTextRanges:withTextRanges:usingOperator:]();
        }
        goto LABEL_63;
      }
    }
    if (v27) {
      int v32 = 4;
    }
    else {
      int v32 = 1;
    }
    if (!v28) {
      int v32 = 2;
    }
    int v33 = v32 & v42;
    if ((v26 & 1) == (v33 != 0)) {
      goto LABEL_60;
    }
    if (v33)
    {
      if (v29) {
        +[NSTextRange combineTextRanges:withTextRanges:usingOperator:]();
      }
      id v29 = *(id *)v31;
      char v26 = 1;
      goto LABEL_60;
    }
LABEL_51:
    if (!v29) {
      +[NSTextRange combineTextRanges:withTextRanges:usingOperator:].cold.4();
    }
    if ([v29 compare:*(void *)v31] == -1)
    {
      v34 = (void *)*((void *)v31 + 2);
      if (v34 && !objc_msgSend(v29, "compare:", objc_msgSend(v34, "location"))) {
        v35 = (NSTextRange *)*((id *)v31 + 2);
      }
      else {
        v35 = [[NSTextRange alloc] initWithLocation:v29 endLocation:*(void *)v31];
      }
      v36 = v35;
      [v25 addObject:v35];
    }
    id v29 = 0;
    goto LABEL_59;
  }
LABEL_63:
  if ([v25 count]) {
    id v8 = v25;
  }
  else {
    id v8 = 0;
  }
  if (v41 >= 0x181) {
    free(__base);
  }
  return v8;
}

uint64_t __62__NSTextRange_combineTextRanges_withTextRanges_usingOperator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)a2 compare:*(void *)a3];
  if (!result)
  {
    if (*(unsigned char *)(a2 + 12)) {
      unsigned int v6 = -1;
    }
    else {
      unsigned int v6 = 1;
    }
    if (*(unsigned __int8 *)(a2 + 12) == *(unsigned __int8 *)(a3 + 12)) {
      return 0;
    }
    else {
      return v6;
    }
  }
  return result;
}

- (void)textRangeByFormingUnionWithTextRange:.cold.1()
{
  __assert_rtn("-[NSTextRange textRangeByFormingUnionWithTextRange:]", "NSTextRange.m", 140, "[newStart compare:newEnd] == NSOrderedAscending && \"union of non-empty ranges is non-empty\"");
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.1()
{
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.2()
{
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.3()
{
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.4()
{
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.5()
{
  __assert_rtn("+[NSTextRange combineTextRanges:withTextRanges:usingOperator:]", "NSTextRange.m", 273, "i == eventCount");
}

@end