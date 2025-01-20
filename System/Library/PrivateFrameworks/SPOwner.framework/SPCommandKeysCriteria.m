@interface SPCommandKeysCriteria
+ (BOOL)supportsSecureCoding;
+ (id)driftModeledCriteria;
+ (id)matchDateInterval:(id)a3;
+ (id)matchPrimaryIndices:(id)a3;
+ (id)matchSecondaryIndex:(unint64_t)a3 hint:(unsigned __int8)a4;
+ (id)matchSequence:(unsigned __int8)a3 index:(unsigned int)a4 hint:(unsigned __int8)a5;
- (NSArray)indices;
- (NSDateInterval)dateInterval;
- (NSNumber)hint;
- (NSNumber)index;
- (NSNumber)sequence;
- (SPCommandKeysCriteria)initWithCoder:(id)a3;
- (SPCommandKeysCriteria)initWithDateInterval:(id)a3 sequence:(id)a4 indices:(id)a5 index:(id)a6 hint:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setHint:(id)a3;
- (void)setIndex:(id)a3;
- (void)setIndices:(id)a3;
- (void)setSequence:(id)a3;
@end

@implementation SPCommandKeysCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(SPCommandKeysCriteria *)self dateInterval];
  [v4 setDateInterval:v5];

  v6 = [(SPCommandKeysCriteria *)self sequence];
  [v4 setSequence:v6];

  v7 = [(SPCommandKeysCriteria *)self indices];
  v8 = (void *)[v7 copy];
  [v4 setIndices:v8];

  v9 = [(SPCommandKeysCriteria *)self index];
  [v4 setIndex:v9];

  v10 = [(SPCommandKeysCriteria *)self hint];
  [v4 setHint:v10];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_sequence forKey:@"sequence"];
  [v5 encodeObject:self->_indices forKey:@"indices"];
  [v5 encodeObject:self->_index forKey:@"index"];
  [v5 encodeObject:self->_hint forKey:@"hint"];
}

- (SPCommandKeysCriteria)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  dateInterval = self->_dateInterval;
  self->_dateInterval = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sequence"];
  sequence = self->_sequence;
  self->_sequence = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"index"];
  index = self->_index;
  self->_index = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hint"];
  hint = self->_hint;
  self->_hint = v11;

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v15 = [v13 setWithArray:v14];
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"indices"];

  indices = self->_indices;
  self->_indices = v16;

  return self;
}

- (SPCommandKeysCriteria)initWithDateInterval:(id)a3 sequence:(id)a4 indices:(id)a5 index:(id)a6 hint:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SPCommandKeysCriteria;
  v17 = [(SPCommandKeysCriteria *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(SPCommandKeysCriteria *)v17 setDateInterval:v12];
    [(SPCommandKeysCriteria *)v18 setSequence:v13];
    [(SPCommandKeysCriteria *)v18 setIndices:v14];
    [(SPCommandKeysCriteria *)v18 setIndex:v15];
    [(SPCommandKeysCriteria *)v18 setHint:v16];
  }

  return v18;
}

+ (id)matchSequence:(unsigned __int8)a3 index:(unsigned int)a4 hint:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = a3;
  v8 = [SPCommandKeysCriteria alloc];
  v9 = [NSNumber numberWithUnsignedChar:v7];
  v10 = [NSNumber numberWithUnsignedInt:v6];
  v11 = [NSNumber numberWithUnsignedChar:v5];
  id v12 = [(SPCommandKeysCriteria *)v8 initWithDateInterval:0 sequence:v9 indices:0 index:v10 hint:v11];

  return v12;
}

+ (id)matchDateInterval:(id)a3
{
  id v3 = a3;
  id v4 = [[SPCommandKeysCriteria alloc] initWithDateInterval:v3 sequence:0 indices:0 index:0 hint:0];

  return v4;
}

+ (id)matchPrimaryIndices:(id)a3
{
  id v3 = a3;
  id v4 = [[SPCommandKeysCriteria alloc] initWithDateInterval:0 sequence:&unk_1F0B31EA0 indices:v3 index:0 hint:0];

  return v4;
}

+ (id)matchSecondaryIndex:(unint64_t)a3 hint:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v6 = [SPCommandKeysCriteria alloc];
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v8 = [NSNumber numberWithUnsignedChar:v4];
  v9 = [(SPCommandKeysCriteria *)v6 initWithDateInterval:0 sequence:&unk_1F0B31EB8 indices:0 index:v7 hint:v8];

  return v9;
}

+ (id)driftModeledCriteria
{
  v2 = [[SPCommandKeysCriteria alloc] initWithDateInterval:0 sequence:0 indices:0 index:0 hint:0];

  return v2;
}

- (NSNumber)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSArray)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (NSNumber)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_sequence, 0);
}

@end