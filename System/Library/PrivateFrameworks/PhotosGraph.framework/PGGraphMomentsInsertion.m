@interface PGGraphMomentsInsertion
- (NSSet)momentUUIDs;
- (NSSet)moments;
- (PGGraphMomentsInsertion)initWithMomentUUIDs:(id)a3;
- (PGGraphMomentsInsertion)initWithMoments:(id)a3;
- (id)description;
- (unint64_t)changeCount;
- (unint64_t)type;
@end

@implementation PGGraphMomentsInsertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moments, 0);
  objc_storeStrong((id *)&self->_momentUUIDs, 0);
}

- (NSSet)moments
{
  return self->_moments;
}

- (NSSet)momentUUIDs
{
  return self->_momentUUIDs;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphMomentsInsertion;
  v4 = [(PGGraphChange *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, momentUUIDs (%lu): %@", v4, -[NSSet count](self->_momentUUIDs, "count"), self->_momentUUIDs];

  return v5;
}

- (unint64_t)changeCount
{
  return [(NSSet *)self->_momentUUIDs count];
}

- (unint64_t)type
{
  return 1;
}

- (PGGraphMomentsInsertion)initWithMoments:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "uuid", (void)v16);
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v13 = [(PGGraphMomentsInsertion *)self initWithMomentUUIDs:v6];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_moments, a3);
  }

  return v14;
}

- (PGGraphMomentsInsertion)initWithMomentUUIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMomentsInsertion;
  v6 = [(PGGraphMomentsInsertion *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_momentUUIDs, a3);
  }

  return v7;
}

@end