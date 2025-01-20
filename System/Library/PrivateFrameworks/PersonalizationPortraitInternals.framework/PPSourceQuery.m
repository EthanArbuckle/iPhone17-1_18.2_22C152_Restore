@interface PPSourceQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSourceQuery:(id)a3;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSSet)matchingBundleIds;
- (NSSet)matchingDocumentIds;
- (NSString)matchingContactHandle;
- (PPSourceQuery)init;
- (PPSourceQuery)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setFromDate:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setMatchingBundleIds:(id)a3;
- (void)setMatchingContactHandle:(id)a3;
- (void)setMatchingDocumentIds:(id)a3;
- (void)setToDate:(id)a3;
@end

@implementation PPSourceQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingContactHandle, 0);
  objc_storeStrong((id *)&self->_matchingDocumentIds, 0);
  objc_storeStrong((id *)&self->_matchingBundleIds, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

- (void)setMatchingContactHandle:(id)a3
{
}

- (NSString)matchingContactHandle
{
  return self->_matchingContactHandle;
}

- (void)setMatchingDocumentIds:(id)a3
{
}

- (NSSet)matchingDocumentIds
{
  return self->_matchingDocumentIds;
}

- (void)setMatchingBundleIds:(id)a3
{
}

- (NSSet)matchingBundleIds
{
  return self->_matchingBundleIds;
}

- (void)setToDate:(id)a3
{
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setFromDate:(id)a3
{
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPSourceQuery l:%tu d:%@-%@ mid:%@ mui:%@ mch:%@", self->_limit, self->_fromDate, self->_toDate, self->_matchingBundleIds, self->_matchingDocumentIds, self->_matchingContactHandle];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPSourceQuery *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PPSourceQuery *)self isEqualToSourceQuery:v4];
  }

  return v5;
}

- (BOOL)isEqualToSourceQuery:(id)a3
{
  v4 = (PPSourceQuery *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else if (v4 && (unint64_t limit = self->_limit, limit == [(PPSourceQuery *)v4 limit]))
  {
    v7 = self->_fromDate;
    uint64_t v8 = [(PPSourceQuery *)v5 fromDate];
    if (!((unint64_t)v7 | v8)) {
      goto LABEL_8;
    }
    v9 = (void *)v8;
    LOBYTE(v10) = 0;
    if (!v7 || !v8) {
      goto LABEL_30;
    }
    int v10 = [(NSDate *)v7 isEqualToDate:v8];

    if (v10)
    {
LABEL_8:
      v7 = self->_toDate;
      uint64_t v11 = [(PPSourceQuery *)v5 toDate];
      if ((unint64_t)v7 | v11)
      {
        v9 = (void *)v11;
        LOBYTE(v10) = 0;
        if (!v7 || !v11) {
          goto LABEL_30;
        }
        int v10 = [(NSDate *)v7 isEqualToDate:v11];

        if (!v10) {
          goto LABEL_31;
        }
      }
      v7 = self->_matchingBundleIds;
      uint64_t v12 = [(PPSourceQuery *)v5 matchingBundleIds];
      if ((unint64_t)v7 | v12)
      {
        v9 = (void *)v12;
        LOBYTE(v10) = 0;
        if (!v7 || !v12) {
          goto LABEL_30;
        }
        int v10 = [(NSDate *)v7 isEqualToSet:v12];

        if (!v10) {
          goto LABEL_31;
        }
      }
      v7 = self->_matchingDocumentIds;
      uint64_t v13 = [(PPSourceQuery *)v5 matchingDocumentIds];
      if (!((unint64_t)v7 | v13))
      {
LABEL_11:
        v7 = self->_matchingContactHandle;
        uint64_t v14 = [(PPSourceQuery *)v5 matchingContactHandle];
        if ((unint64_t)v7 | v14)
        {
          v9 = (void *)v14;
          LOBYTE(v10) = 0;
          if (v7 && v14) {
            LOBYTE(v10) = [(NSDate *)v7 isEqualToString:v14];
          }
        }
        else
        {
          v9 = 0;
          v7 = 0;
          LOBYTE(v10) = 1;
        }
        goto LABEL_30;
      }
      v9 = (void *)v13;
      LOBYTE(v10) = 0;
      if (v7 && v13)
      {
        int v10 = [(NSDate *)v7 isEqualToSet:v13];

        if (!v10) {
          goto LABEL_31;
        }
        goto LABEL_11;
      }
LABEL_30:
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
LABEL_31:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v5 = v4;
  if (v4)
  {
    [v4 setLimit:self->_limit];
    [v5 setFromDate:self->_fromDate];
    [v5 setToDate:self->_toDate];
    [v5 setMatchingBundleIds:self->_matchingBundleIds];
    [v5 setMatchingDocumentIds:self->_matchingDocumentIds];
    [v5 setMatchingContactHandle:self->_matchingContactHandle];
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t limit = self->_limit;
  uint64_t v4 = [(NSDate *)self->_fromDate hash] - limit + 32 * limit;
  uint64_t v5 = [(NSDate *)self->_toDate hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSSet *)self->_matchingBundleIds hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSSet *)self->_matchingDocumentIds hash] - v6 + 32 * v6;
  return [(NSString *)self->_matchingContactHandle hash] - v7 + 32 * v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t limit = self->_limit;
  id v5 = a3;
  [v5 encodeInteger:limit forKey:@"lmt"];
  [v5 encodeObject:self->_fromDate forKey:@"fdt"];
  [v5 encodeObject:self->_toDate forKey:@"tdt"];
  [v5 encodeObject:self->_matchingBundleIds forKey:@"mbdl"];
  [v5 encodeObject:self->_matchingDocumentIds forKey:@"mdids"];
  [v5 encodeObject:self->_matchingContactHandle forKey:@"mch"];
}

- (PPSourceQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PPSourceQuery;
  id v5 = [(PPSourceQuery *)&v21 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1CB79D060]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    v5->_unint64_t limit = [v4 decodeIntegerForKey:@"lmt"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fdt"];
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tdt"];
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v9 forKey:@"mbdl"];
    matchingBundleIds = v5->_matchingBundleIds;
    v5->_matchingBundleIds = (NSSet *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v9 forKey:@"mdids"];
    matchingDocumentIds = v5->_matchingDocumentIds;
    v5->_matchingDocumentIds = (NSSet *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mch"];
    matchingContactHandle = v5->_matchingContactHandle;
    v5->_matchingContactHandle = (NSString *)v18;
  }
  return v5;
}

- (PPSourceQuery)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPSourceQuery;
  result = [(PPSourceQuery *)&v3 init];
  if (result) {
    result->_unint64_t limit = -1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end