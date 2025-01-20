@interface PXDateRangeSet
+ (id)dateRangeSet;
+ (id)dateRangeSetWithDateRange:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)_dateRanges;
- (PXDateRangeSet)init;
- (PXDateRangeSet)initWithDateRange:(id)a3;
- (id)dateRanges;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (void)set_dateRanges:(id)a3;
@end

@implementation PXDateRangeSet

- (void).cxx_destruct
{
}

- (void)set_dateRanges:(id)a3
{
}

- (NSMutableArray)_dateRanges
{
  return self->__dateRanges;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PXDateRangeSet;
  v4 = [(PXDateRangeSet *)&v8 description];
  v5 = [(PXDateRangeSet *)self _dateRanges];
  v6 = [v3 stringWithFormat:@"<%@ dateRanges=%@>", v4, v5];

  return v6;
}

- (id)dateRanges
{
  v2 = [(PXDateRangeSet *)self _dateRanges];
  v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXDateRangeSet *)a3;
  if (v4 == self) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  dateRanges = self->__dateRanges;
  if (dateRanges == v4->__dateRanges) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSMutableArray isEqualToArray:](dateRanges, "isEqualToArray:");
  }
LABEL_7:

  return v6;
}

- (int64_t)count
{
  v2 = [(PXDateRangeSet *)self _dateRanges];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PXMutableDateRangeSet);
  v5 = [(PXDateRangeSet *)self _dateRanges];
  char v6 = (void *)[v5 mutableCopy];
  [(PXDateRangeSet *)v4 set_dateRanges:v6];

  return v4;
}

+ (id)dateRangeSet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)dateRangeSetWithDateRange:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDateRange:v3];

  return v4;
}

- (PXDateRangeSet)initWithDateRange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDateRangeSet;
  v5 = [(PXDateRangeSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v4, 0);
    dateRanges = v5->__dateRanges;
    v5->__dateRanges = (NSMutableArray *)v6;
  }
  return v5;
}

- (PXDateRangeSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXDateRangeSet;
  id v2 = [(PXDateRangeSet *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dateRanges = v2->__dateRanges;
    v2->__dateRanges = v3;
  }
  return v2;
}

@end