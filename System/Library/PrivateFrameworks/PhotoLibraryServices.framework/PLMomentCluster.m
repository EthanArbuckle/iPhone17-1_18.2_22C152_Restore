@interface PLMomentCluster
- (BOOL)isEqual:(id)a3;
- (NSArray)moments;
- (NSDate)endDate;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDate)startDate;
- (PLMomentCluster)initWithMomentClusters:(id)a3;
- (PLMomentCluster)initWithMoments:(id)a3;
- (unint64_t)hash;
@end

@implementation PLMomentCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_moments, 0);
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)moments
{
  return self->_moments;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLMomentCluster *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      startDate = self->_startDate;
      v6 = [(PLMomentCluster *)v4 startDate];
      if ([(NSDate *)startDate isEqual:v6])
      {
        endDate = self->_endDate;
        v8 = [(PLMomentCluster *)v4 endDate];
        if ([(NSDate *)endDate isEqual:v8])
        {
          NSUInteger v9 = [(NSArray *)self->_moments count];
          v10 = [(PLMomentCluster *)v4 moments];
          BOOL v11 = v9 == [v10 count];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSArray *)self->_moments count];
  uint64_t v4 = [(NSDate *)self->_startDate hash] ^ v3;
  return v4 ^ [(NSDate *)self->_endDate hash];
}

- (PLMomentCluster)initWithMomentClusters:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "moments", (void)v14);
        [v5 addObjectsFromArray:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [(PLMomentCluster *)self initWithMoments:v5];
  return v12;
}

- (PLMomentCluster)initWithMoments:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v21.receiver = self;
    v21.super_class = (Class)PLMomentCluster;
    id v5 = [(PLMomentCluster *)&v21 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      moments = v5->_moments;
      v5->_moments = (NSArray *)v6;

      uint64_t v8 = [(NSArray *)v5->_moments firstObject];
      uint64_t v9 = [(NSArray *)v5->_moments lastObject];
      uint64_t v10 = [v8 startDate];
      startDate = v5->_startDate;
      v5->_startDate = (NSDate *)v10;

      uint64_t v12 = [v9 endDate];
      endDate = v5->_endDate;
      v5->_endDate = (NSDate *)v12;

      uint64_t v14 = [v8 localStartDate];
      localStartDate = v5->_localStartDate;
      v5->_localStartDate = (NSDate *)v14;

      uint64_t v16 = [v9 localEndDate];
      localEndDate = v5->_localEndDate;
      v5->_localEndDate = (NSDate *)v16;
    }
    self = v5;
    v18 = self;
  }
  else
  {
    uint64_t v19 = PLMomentsGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Trying to initialize MomentCluster with 0 moments.", buf, 2u);
    }

    v18 = 0;
  }

  return v18;
}

@end