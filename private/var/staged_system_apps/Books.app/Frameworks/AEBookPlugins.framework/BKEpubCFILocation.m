@interface BKEpubCFILocation
+ (BOOL)supportsSecureCoding;
+ (id)deserializeLocationFromDictionary:(id)a3;
+ (id)locationForCFI:(id)a3 error:(id *)a4;
+ (id)stringByEscapingString:(id)a3;
+ (id)unknownLocation;
- (BCCFI)cfi;
- (BKEpubCFILocation)initWithCFI:(id)a3;
- (BKEpubCFILocation)initWithCFI:(id)a3 error:(id *)a4;
- (BKEpubCFILocation)initWithCoder:(id)a3;
- (BKEpubCFILocation)initWithLocationDictionary:(id)a3;
- (BKEpubCFILocation)locationWithAdjustedSpineIndex:(int64_t)a3 error:(id *)a4;
- (BKEpubLocation)wk1EpubLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPageLocation;
- (NSString)cfiString;
- (NSString)debugDescription;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)ensureRange;
- (id)head;
- (id)intersectWithRangeFromHeadOf:(id)a3 toTailOf:(id)a4;
- (id)rebaseCFIWithHead:(id)a3;
- (id)serializeLocationToDictionary;
- (id)unionWithCFI:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)ordinal;
- (unint64_t)hash;
- (unint64_t)pageOffset;
- (void)encodeWithCoder:(id)a3;
- (void)setCfi:(id)a3;
- (void)setIsPageLocation:(BOOL)a3;
- (void)setOrdinal:(int64_t)a3;
- (void)setPageOffset:(unint64_t)a3;
- (void)setWk1EpubLocation:(id)a3;
- (void)updateOrdinalForBookInfo:(id)a3;
@end

@implementation BKEpubCFILocation

+ (id)unknownLocation
{
  if (qword_22B640 != -1) {
    dispatch_once(&qword_22B640, &stru_1DD2E8);
  }
  v2 = (void *)qword_22B638;

  return v2;
}

- (NSString)cfiString
{
  v2 = [(BKEpubCFILocation *)self cfi];
  v3 = [v2 string];

  return (NSString *)v3;
}

+ (id)locationForCFI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithCFI:v6 error:a4];

  return v7;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"class"];
  if ([v4 isEqualToString:@"BKEpubCFILocation"]) {
    v5 = [[BKEpubCFILocation alloc] initWithLocationDictionary:v3];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (BKEpubCFILocation)initWithCFI:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKEpubCFILocation;
  id v6 = [(BKEpubCFILocation *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cfi, a3);
    v7->_pageOffset = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BKEpubCFILocation)initWithCFI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BKEpubCFILocation;
  id v7 = [(BKEpubCFILocation *)&v19 init];
  if (v7)
  {
    if (+[BCCFI isFragmentEpubCFIFunction:v6])
    {
      id v18 = 0;
      uint64_t v8 = +[BCCFI cfiWithString:v6 error:&v18];
      id v9 = v18;
      cfi = v7->_cfi;
      v7->_cfi = (BCCFI *)v8;
    }
    else
    {
      id v11 = [v6 rangeOfString:@"epubcfi"];
      if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v9 = +[NSError errorWithDomain:@"BKEpubCFIErrorDomain" code:1 userInfo:0];
      }
      else
      {
        v12 = [v6 substringFromIndex:v11];
        id v17 = 0;
        uint64_t v13 = +[BCCFI cfiWithString:v12 error:&v17];
        id v9 = v17;
        v14 = v7->_cfi;
        v7->_cfi = (BCCFI *)v13;
      }
    }
    v7->_pageOffset = 0x7FFFFFFFFFFFFFFFLL;
    if (v9)
    {
      v15 = _AELog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Error %@ forming BCCFI from string %@", buf, 0x16u);
      }

      if (a4) {
        *a4 = v9;
      }

      id v7 = 0;
    }
  }
  return v7;
}

- (BKEpubCFILocation)initWithLocationDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"super"];
  v14.receiver = self;
  v14.super_class = (Class)BKEpubCFILocation;
  id v6 = [(BKLocation *)&v14 initWithLocationDictionary:v5];

  if (v6)
  {
    id v7 = [v4 objectForKey:@"cfi"];
    id v13 = 0;
    uint64_t v8 = (BCCFI *)[objc_alloc((Class)BCCFI) initWithCFI:v7 error:&v13];
    id v9 = v13;
    cfi = v6->_cfi;
    v6->_cfi = v8;

    if (v9)
    {
      id v11 = _AELog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v9;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Error %@ forming BCCFI from string %@", buf, 0x16u);
      }

      id v6 = 0;
    }
  }
  return v6;
}

- (BKEpubCFILocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKEpubCFILocation;
  id v5 = [(BKLocation *)&v13 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cfi"];
    id v12 = 0;
    id v7 = (BCCFI *)[objc_alloc((Class)BCCFI) initWithCFI:v6 error:&v12];
    id v8 = v12;
    cfi = v5->_cfi;
    v5->_cfi = v7;

    if (v8)
    {
      v10 = _AELog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v8;
        __int16 v16 = 2112;
        __int16 v17 = v6;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Error %@ forming BCCFI from string %@", buf, 0x16u);
      }

      id v5 = 0;
    }
  }
  return v5;
}

- (id)serializeLocationToDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)BKEpubCFILocation;
  id v3 = [(BKLocation *)&v7 serializeLocationToDictionary];
  id v4 = [(BKEpubCFILocation *)self cfiString];
  id v5 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"super", @"BKEpubCFILocation", @"class", v4, @"cfi", 0];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKEpubCFILocation;
  id v4 = a3;
  [(BKLocation *)&v6 encodeWithCoder:v4];
  id v5 = [(BKEpubCFILocation *)self cfiString];
  [v4 encodeObject:v5 forKey:@"cfi"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setOrdinal:(int64_t)a3
{
  id v6 = [(BKEpubCFILocation *)self cfi];
  id v5 = [v6 cfiWithAdjustedSpineIndex:a3 error:0];
  [(BKEpubCFILocation *)self setCfi:v5];
}

- (int64_t)ordinal
{
  v2 = [(BKEpubCFILocation *)self cfi];
  id v3 = [v2 spineIndex];

  return (int64_t)v3;
}

- (void)updateOrdinalForBookInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(BKEpubCFILocation *)self cfi];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_CC5A0;
  v8[3] = &unk_1DD310;
  id v9 = v4;
  id v6 = v4;
  objc_super v7 = [v5 cfiWithSpineIndexAdjustedUsingAssertionBlock:v8];
  [(BKEpubCFILocation *)self setCfi:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)BKEpubCFILocation,
        [(BKLocation *)&v9 isEqual:v4]))
  {
    id v5 = [(BKEpubCFILocation *)self cfi];
    id v6 = [v4 cfi];
    BOOL v7 = [v5 compare:v6] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(BKEpubCFILocation *)self cfi];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(BKEpubCFILocation *)self cfi];
  id v6 = [v4 cfi];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  id v5 = [(BKEpubCFILocation *)self cfi];
  id v6 = [v5 copy];
  [v4 setCfi:v6];

  return v4;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BKEpubCFILocation *)self cfi];
  id v6 = [v5 redactedString];
  id v7 = +[NSString stringWithFormat:@"<%@: %p %@ pageOffset:%lu>", v4, self, v6, [(BKEpubCFILocation *)self pageOffset]];

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BKEpubCFILocation *)self cfi];
  id v6 = [v5 debugDescription];
  id v7 = +[NSString stringWithFormat:@"<%@: %p %@ pageOffset:%lu>", v4, self, v6, [(BKEpubCFILocation *)self pageOffset]];

  return (NSString *)v7;
}

- (id)intersectWithRangeFromHeadOf:(id)a3 toTailOf:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKEpubCFILocation *)self cfi];
  objc_super v9 = [v7 cfi];

  v10 = [v6 cfi];

  id v11 = [v8 intersectWithRangeFromHeadOf:v9 toTailOf:v10];

  if (v11) {
    id v12 = [[BKEpubCFILocation alloc] initWithCFI:v11];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)rebaseCFIWithHead:(id)a3
{
  cfi = self->_cfi;
  id v4 = [a3 cfi];
  id v5 = [(BCCFI *)cfi rebaseCFIWithHead:v4];

  if (v5) {
    id v6 = [[BKEpubCFILocation alloc] initWithCFI:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)unionWithCFI:(id)a3
{
  id v4 = a3;
  id v5 = [(BKEpubCFILocation *)self cfi];
  id v6 = [v4 cfi];

  id v7 = [v5 unionWithCFI:v6];

  if (v7) {
    id v8 = [[BKEpubCFILocation alloc] initWithCFI:v7];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)ensureRange
{
  v2 = [(BCCFI *)self->_cfi ensureRange];
  if (v2) {
    id v3 = [[BKEpubCFILocation alloc] initWithCFI:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)head
{
  if ([(BCCFI *)self->_cfi isRange])
  {
    id v3 = [BKEpubCFILocation alloc];
    id v4 = [(BCCFI *)self->_cfi headCFI];
    id v5 = [(BKEpubCFILocation *)v3 initWithCFI:v4];
  }
  else
  {
    id v5 = self;
  }

  return v5;
}

+ (id)stringByEscapingString:(id)a3
{
  return +[BCCFI stringByEscapingString:a3];
}

- (BKEpubCFILocation)locationWithAdjustedSpineIndex:(int64_t)a3 error:(id *)a4
{
  id v4 = [(BCCFI *)self->_cfi cfiWithAdjustedSpineIndex:a3 error:a4];
  if (v4) {
    id v5 = [[BKEpubCFILocation alloc] initWithCFI:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BCCFI)cfi
{
  return self->_cfi;
}

- (void)setCfi:(id)a3
{
}

- (BKEpubLocation)wk1EpubLocation
{
  return self->_wk1EpubLocation;
}

- (void)setWk1EpubLocation:(id)a3
{
}

- (BOOL)isPageLocation
{
  return self->_isPageLocation;
}

- (void)setIsPageLocation:(BOOL)a3
{
  self->_isPageLocation = a3;
}

- (unint64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(unint64_t)a3
{
  self->_pageOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wk1EpubLocation, 0);

  objc_storeStrong((id *)&self->_cfi, 0);
}

@end