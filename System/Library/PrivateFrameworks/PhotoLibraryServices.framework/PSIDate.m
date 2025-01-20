@interface PSIDate
+ (id)distantFuture;
+ (id)distantPast;
- (BOOL)isEqual:(id)a3;
- (PSIDate)initWithDateComponents:(id)a3;
- (PSIDate)initWithInt64Representation:(int64_t)a3;
- (PSIDate)initWithUniversalDate:(id)a3 calendar:(id)a4;
- (id)dateComponents;
- (id)description;
- (int64_t)day;
- (int64_t)era;
- (int64_t)int64Representation;
- (int64_t)int64RepresentationMask;
- (int64_t)month;
- (int64_t)year;
- (unint64_t)hash;
@end

@implementation PSIDate

- (PSIDate)initWithDateComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 year];
  uint64_t v6 = [v4 month];
  uint64_t v7 = [v4 day];
  uint64_t v8 = v7;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [v4 yearForWeekOfYear];
    uint64_t v10 = [v4 weekOfYear];
    uint64_t v11 = [v4 weekday];
    uint64_t v12 = v11;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v4 weekdayOrdinal] == 0x7FFFFFFFFFFFFFFFLL
        && [v4 quarter] == 0x7FFFFFFFFFFFFFFFLL
        && [v4 weekOfMonth] == 0x7FFFFFFFFFFFFFFFLL
        && v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v27 = v10 != 0x7FFFFFFFFFFFFFFFLL;
        BOOL v28 = v9 != 0x7FFFFFFFFFFFFFFFLL;

        if (v5 != 0x7FFFFFFFFFFFFFFFLL
          || v6 != 0x7FFFFFFFFFFFFFFFLL
          || v8 != 0x7FFFFFFFFFFFFFFFLL
          || ((v28 ^ v27) & 1) == 0)
        {
          goto LABEL_8;
        }
      }
      else
      {
      }
      v26 = 0;
      goto LABEL_38;
    }
  }

LABEL_8:
  id v13 = v4;
  if ([v13 era] == 0x7FFFFFFFFFFFFFFFLL
    && [v13 year] == 0x7FFFFFFFFFFFFFFFLL
    && [v13 month] == 0x7FFFFFFFFFFFFFFFLL
    && [v13 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v15 = [v14 dateFromComponents:v13];
    id v16 = [v14 components:30 fromDate:v15];
  }
  else
  {
    id v16 = v13;
  }

  if (v16)
  {
    v30.receiver = self;
    v30.super_class = (Class)PSIDate;
    v17 = [(PSIDate *)&v30 init];
    if (v17)
    {
      uint64_t v18 = [v16 era];
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int8x16_t v19 = (int8x16_t)vdupq_n_s64(0xFFF000000uLL);
        v19.i64[0] = (unint64_t)(v18 & 0xFFF) << 24;
        *(int8x16_t *)(v17 + 8) = vorrq_s8(*(int8x16_t *)(v17 + 8), v19);
      }
      uint64_t v20 = [v16 year];
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int8x16_t v21 = (int8x16_t)vdupq_n_s64(0xFFF000uLL);
        v21.i64[0] = (unint64_t)(v20 & 0xFFF) << 12;
        *(int8x16_t *)(v17 + 8) = vorrq_s8(*(int8x16_t *)(v17 + 8), v21);
      }
      uint64_t v22 = [v16 month];
      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int8x16_t v23 = (int8x16_t)vdupq_n_s64(0xF00uLL);
        v23.i64[0] = (unint64_t)(v22 & 0xF) << 8;
        *(int8x16_t *)(v17 + 8) = vorrq_s8(*(int8x16_t *)(v17 + 8), v23);
      }
      uint64_t v24 = [v16 day];
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25.i64[1] = 255;
        v25.i64[0] = v24;
        *(int8x16_t *)(v17 + 8) = vorrq_s8(*(int8x16_t *)(v17 + 8), v25);
      }
    }
    self = v17;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

LABEL_38:
  return v26;
}

- (int64_t)int64Representation
{
  return self->_int64Representation;
}

- (int64_t)int64RepresentationMask
{
  return self->_int64RepresentationMask;
}

- (id)dateComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v4 = v3;
  unint64_t int64Representation = self->_int64Representation;
  int64_t int64RepresentationMask = self->_int64RepresentationMask;
  if ((int64RepresentationMask & 0xFFF000000) != 0) {
    uint64_t v7 = (int64Representation >> 24) & 0xFFF;
  }
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    objc_msgSend(v3, "setEra:");
    unint64_t int64Representation = self->_int64Representation;
    int64_t int64RepresentationMask = self->_int64RepresentationMask;
  }
  if ((int64RepresentationMask & 0xFFF000) != 0) {
    uint64_t v8 = (int64Representation >> 12) & 0xFFF;
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    objc_msgSend(v4, "setYear:");
    unint64_t int64Representation = self->_int64Representation;
    int64_t int64RepresentationMask = self->_int64RepresentationMask;
  }
  if ((int64RepresentationMask & 0xF00) != 0) {
    uint64_t v9 = (int64Representation >> 8) & 0xF;
  }
  else {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    objc_msgSend(v4, "setMonth:");
    LOBYTE(int64Representation) = self->_int64Representation;
    LOBYTE(int64RepresentationMask) = self->_int64RepresentationMask;
  }
  if ((_BYTE)int64RepresentationMask) {
    uint64_t v10 = int64Representation;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v10) {
    objc_msgSend(v4, "setDay:");
  }
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d/%d/%d Era: %d", -[PSIDate day](self, "day"), -[PSIDate month](self, "month"), -[PSIDate year](self, "year"), -[PSIDate era](self, "era"));
}

- (int64_t)day
{
  if (LOBYTE(self->_int64RepresentationMask)) {
    return LOBYTE(self->_int64Representation);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)month
{
  if ((self->_int64RepresentationMask & 0xF00) != 0) {
    return ((unint64_t)self->_int64Representation >> 8) & 0xF;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)year
{
  if ((self->_int64RepresentationMask & 0xFFF000) != 0) {
    return ((unint64_t)self->_int64Representation >> 12) & 0xFFF;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)era
{
  if ((self->_int64RepresentationMask & 0xFFF000000) != 0) {
    return ((unint64_t)self->_int64Representation >> 24) & 0xFFF;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (PSIDate)initWithInt64Representation:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PSIDate;
  result = [(PSIDate *)&v12 init];
  if (result)
  {
    unint64_t v5 = ((unint64_t)a3 >> 24) & 0xFFF;
    if (v5 - 1 <= 0xFFD)
    {
      int8x16_t v6 = (int8x16_t)vdupq_n_s64(0xFFF000000uLL);
      v6.i64[0] = v5 << 24;
      *(int8x16_t *)&result->_unint64_t int64Representation = vorrq_s8(*(int8x16_t *)&result->_int64Representation, v6);
    }
    unint64_t v7 = ((unint64_t)a3 >> 12) & 0xFFF;
    if (v7 - 1 <= 0xFFD)
    {
      int8x16_t v8 = (int8x16_t)vdupq_n_s64(0xFFF000uLL);
      v8.i64[0] = v7 << 12;
      *(int8x16_t *)&result->_unint64_t int64Representation = vorrq_s8(*(int8x16_t *)&result->_int64Representation, v8);
    }
    unint64_t v9 = ((unint64_t)a3 >> 8) & 0xF;
    if (v9 - 1 <= 0xD)
    {
      int8x16_t v10 = (int8x16_t)vdupq_n_s64(0xF00uLL);
      v10.i64[0] = v9 << 8;
      *(int8x16_t *)&result->_unint64_t int64Representation = vorrq_s8(*(int8x16_t *)&result->_int64Representation, v10);
    }
    if ((unint64_t)a3 - 1 <= 0xFD)
    {
      v11.i64[1] = 255;
      v11.i64[0] = a3;
      *(int8x16_t *)&result->_unint64_t int64Representation = vorrq_s8(*(int8x16_t *)&result->_int64Representation, v11);
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PSIDate *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_int64Representation == self->_int64Representation
      && v4->_int64RepresentationMask == self->_int64RepresentationMask;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_int64Representation;
}

- (PSIDate)initWithUniversalDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PSIDate;
  int8x16_t v8 = [(PSIDate *)&v19 init];
  if (v8)
  {
    unint64_t v9 = [v7 components:30 fromDate:v6];
    __int16 v10 = [v9 era];
    int8x16_t v11 = (int8x16_t)vdupq_n_s64(0xFFF000000uLL);
    v11.i64[0] = (unint64_t)(v10 & 0xFFF) << 24;
    *(int8x16_t *)(v8 + 8) = vorrq_s8(v11, *(int8x16_t *)(v8 + 8));
    __int16 v12 = [v9 year];
    int8x16_t v13 = (int8x16_t)vdupq_n_s64(0xFFF000uLL);
    v13.i64[0] = (unint64_t)(v12 & 0xFFF) << 12;
    *(int8x16_t *)(v8 + 8) = vorrq_s8(v13, *(int8x16_t *)(v8 + 8));
    char v14 = [v9 month];
    int8x16_t v15 = (int8x16_t)vdupq_n_s64(0xF00uLL);
    v15.i64[0] = (unint64_t)(v14 & 0xF) << 8;
    *(int8x16_t *)(v8 + 8) = vorrq_s8(v15, *(int8x16_t *)(v8 + 8));
    unsigned __int8 v16 = [v9 day];
    v17.i64[1] = 255;
    v17.i64[0] = v16;
    *(int8x16_t *)(v8 + 8) = vorrq_s8(*(int8x16_t *)(v8 + 8), v17);
  }
  return (PSIDate *)v8;
}

+ (id)distantFuture
{
  v2 = objc_alloc_init(PSIDate);
  *(_OWORD *)&v2->_unint64_t int64Representation = xmmword_19BA9A040;
  return v2;
}

+ (id)distantPast
{
  v2 = objc_alloc_init(PSIDate);
  *(_OWORD *)&v2->_unint64_t int64Representation = xmmword_19BA9A050;
  return v2;
}

@end