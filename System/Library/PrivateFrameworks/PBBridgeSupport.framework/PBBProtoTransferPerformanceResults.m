@interface PBBProtoTransferPerformanceResults
+ (Class)macroActivitesType;
+ (Class)measuresType;
+ (Class)milestonesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)macroActivites;
- (NSMutableArray)measures;
- (NSMutableArray)milestones;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)macroActivitesAtIndex:(unint64_t)a3;
- (id)measuresAtIndex:(unint64_t)a3;
- (id)milestonesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)macroActivitesCount;
- (unint64_t)measuresCount;
- (unint64_t)milestonesCount;
- (void)addMacroActivites:(id)a3;
- (void)addMeasures:(id)a3;
- (void)addMilestones:(id)a3;
- (void)clearMacroActivites;
- (void)clearMeasures;
- (void)clearMilestones;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMacroActivites:(id)a3;
- (void)setMeasures:(id)a3;
- (void)setMilestones:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoTransferPerformanceResults

- (void)clearMilestones
{
}

- (void)addMilestones:(id)a3
{
  id v4 = a3;
  milestones = self->_milestones;
  id v8 = v4;
  if (!milestones)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_milestones;
    self->_milestones = v6;

    id v4 = v8;
    milestones = self->_milestones;
  }
  [(NSMutableArray *)milestones addObject:v4];
}

- (unint64_t)milestonesCount
{
  return [(NSMutableArray *)self->_milestones count];
}

- (id)milestonesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_milestones objectAtIndex:a3];
}

+ (Class)milestonesType
{
  return (Class)objc_opt_class();
}

- (void)clearMeasures
{
}

- (void)addMeasures:(id)a3
{
  id v4 = a3;
  measures = self->_measures;
  id v8 = v4;
  if (!measures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_measures;
    self->_measures = v6;

    id v4 = v8;
    measures = self->_measures;
  }
  [(NSMutableArray *)measures addObject:v4];
}

- (unint64_t)measuresCount
{
  return [(NSMutableArray *)self->_measures count];
}

- (id)measuresAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_measures objectAtIndex:a3];
}

+ (Class)measuresType
{
  return (Class)objc_opt_class();
}

- (void)clearMacroActivites
{
}

- (void)addMacroActivites:(id)a3
{
  id v4 = a3;
  macroActivites = self->_macroActivites;
  id v8 = v4;
  if (!macroActivites)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_macroActivites;
    self->_macroActivites = v6;

    id v4 = v8;
    macroActivites = self->_macroActivites;
  }
  [(NSMutableArray *)macroActivites addObject:v4];
}

- (unint64_t)macroActivitesCount
{
  return [(NSMutableArray *)self->_macroActivites count];
}

- (id)macroActivitesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_macroActivites objectAtIndex:a3];
}

+ (Class)macroActivitesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoTransferPerformanceResults;
  id v4 = [(PBBProtoTransferPerformanceResults *)&v8 description];
  v5 = [(PBBProtoTransferPerformanceResults *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_milestones count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_milestones, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v5 = self->_milestones;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"milestones"];
  }
  if ([(NSMutableArray *)self->_measures count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_measures, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v12 = self->_measures;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v30 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"measures"];
  }
  if ([(NSMutableArray *)self->_macroActivites count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_macroActivites, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v19 = self->_macroActivites;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "dictionaryRepresentation", (void)v26);
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"macroActivites"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoTransferPerformanceResultsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_milestones;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_measures;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_macroActivites;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if ([(PBBProtoTransferPerformanceResults *)self milestonesCount])
  {
    [v16 clearMilestones];
    unint64_t v4 = [(PBBProtoTransferPerformanceResults *)self milestonesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PBBProtoTransferPerformanceResults *)self milestonesAtIndex:i];
        [v16 addMilestones:v7];
      }
    }
  }
  if ([(PBBProtoTransferPerformanceResults *)self measuresCount])
  {
    [v16 clearMeasures];
    unint64_t v8 = [(PBBProtoTransferPerformanceResults *)self measuresCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(PBBProtoTransferPerformanceResults *)self measuresAtIndex:j];
        [v16 addMeasures:v11];
      }
    }
  }
  if ([(PBBProtoTransferPerformanceResults *)self macroActivitesCount])
  {
    [v16 clearMacroActivites];
    unint64_t v12 = [(PBBProtoTransferPerformanceResults *)self macroActivitesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(PBBProtoTransferPerformanceResults *)self macroActivitesAtIndex:k];
        [v16 addMacroActivites:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = self->_milestones;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addMilestones:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v12 = self->_measures;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addMeasures:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_macroActivites;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addMacroActivites:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((milestones = self->_milestones, !((unint64_t)milestones | v4[3]))
     || -[NSMutableArray isEqual:](milestones, "isEqual:"))
    && ((measures = self->_measures, !((unint64_t)measures | v4[2]))
     || -[NSMutableArray isEqual:](measures, "isEqual:")))
  {
    macroActivites = self->_macroActivites;
    if ((unint64_t)macroActivites | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](macroActivites, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_milestones hash];
  uint64_t v4 = [(NSMutableArray *)self->_measures hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_macroActivites hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PBBProtoTransferPerformanceResults *)self addMilestones:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(PBBProtoTransferPerformanceResults *)self addMeasures:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[1];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[PBBProtoTransferPerformanceResults addMacroActivites:](self, "addMacroActivites:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (NSMutableArray)milestones
{
  return self->_milestones;
}

- (void)setMilestones:(id)a3
{
}

- (NSMutableArray)measures
{
  return self->_measures;
}

- (void)setMeasures:(id)a3
{
}

- (NSMutableArray)macroActivites
{
  return self->_macroActivites;
}

- (void)setMacroActivites:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_measures, 0);
  objc_storeStrong((id *)&self->_macroActivites, 0);
}

@end