@interface PKPassAnnotations
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)archivedTimestamp;
- (PKPassAnnotations)initWithCoder:(id)a3;
- (PKPassAnnotations)initWithDictionary:(id)a3;
- (PKPassAnnotations)initWithSortingState:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sortingState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArchivedTimestamp:(id)a3;
- (void)setSortingState:(int64_t)a3;
@end

@implementation PKPassAnnotations

- (void)setSortingState:(int64_t)a3
{
  self->_sortingState = a3;
}

- (void)setArchivedTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSDate)archivedTimestamp
{
  return self->_archivedTimestamp;
}

- (int64_t)sortingState
{
  return self->_sortingState;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sortingState = self->_sortingState;
  id v5 = a3;
  [v5 encodeInteger:sortingState forKey:@"sortingState"];
  [v5 encodeObject:self->_archivedTimestamp forKey:@"archivedTimestamp"];
}

- (PKPassAnnotations)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAnnotations;
  id v5 = [(PKPassAnnotations *)&v9 init];
  if (v5)
  {
    v5->_int64_t sortingState = [v4 decodeIntegerForKey:@"sortingState"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedTimestamp"];
    archivedTimestamp = v5->_archivedTimestamp;
    v5->_archivedTimestamp = (NSDate *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PKPassAnnotations allocWithZone:a3] init];
  v4->_int64_t sortingState = self->_sortingState;
  objc_storeStrong((id *)&v4->_archivedTimestamp, self->_archivedTimestamp);
  return v4;
}

- (PKPassAnnotations)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAnnotations;
  id v5 = [(PKPassAnnotations *)&v9 init];
  if (v5)
  {
    v5->_int64_t sortingState = [v4 PKIntegerForKey:@"sortingState"];
    uint64_t v6 = [v4 PKDateForKey:@"archivedTimestamp"];
    archivedTimestamp = v5->_archivedTimestamp;
    v5->_archivedTimestamp = (NSDate *)v6;
  }
  return v5;
}

- (PKPassAnnotations)initWithSortingState:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassAnnotations;
  id v4 = [(PKPassAnnotations *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_int64_t sortingState = a3;
    if (a3 == 1)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
      archivedTimestamp = v5->_archivedTimestamp;
      v5->_archivedTimestamp = (NSDate *)v6;
    }
    else
    {
      archivedTimestamp = v4->_archivedTimestamp;
      v4->_archivedTimestamp = 0;
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int64_t sortingState = self->_sortingState;
  if (sortingState == [v4 sortingState])
  {
    archivedTimestamp = self->_archivedTimestamp;
    uint64_t v7 = [v4 archivedTimestamp];
    v8 = (void *)v7;
    if (archivedTimestamp && v7) {
      char v9 = [(NSDate *)archivedTimestamp isEqual:v7];
    }
    else {
      char v9 = archivedTimestamp == (NSDate *)v7;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_archivedTimestamp)
  {
    v6[0] = self->_archivedTimestamp;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    uint64_t v4 = PKCombinedHash(17, v3);
  }
  else
  {
    uint64_t v4 = PKCombinedHash(17, 0);
  }
  return self->_sortingState - v4 + 32 * v4;
}

@end