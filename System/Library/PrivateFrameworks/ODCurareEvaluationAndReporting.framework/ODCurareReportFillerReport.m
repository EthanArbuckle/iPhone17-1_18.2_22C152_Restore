@interface ODCurareReportFillerReport
+ (Class)metadataListType;
+ (Class)modelEvaluationSummariesType;
+ (Class)modelInformationListType;
+ (Class)personalizationEvaluationSummariesType;
- (BOOL)frameworkFailure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)metadataLists;
- (NSMutableArray)modelEvaluationSummaries;
- (NSMutableArray)modelInformationLists;
- (NSMutableArray)personalizationEvaluationSummaries;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metadataListAtIndex:(unint64_t)a3;
- (id)modelEvaluationSummariesAtIndex:(unint64_t)a3;
- (id)modelInformationListAtIndex:(unint64_t)a3;
- (id)personalizationEvaluationSummariesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)metadataListsCount;
- (unint64_t)modelEvaluationSummariesCount;
- (unint64_t)modelInformationListsCount;
- (unint64_t)personalizationEvaluationSummariesCount;
- (void)addMetadataList:(id)a3;
- (void)addModelEvaluationSummaries:(id)a3;
- (void)addModelInformationList:(id)a3;
- (void)addPersonalizationEvaluationSummaries:(id)a3;
- (void)clearMetadataLists;
- (void)clearModelEvaluationSummaries;
- (void)clearModelInformationLists;
- (void)clearPersonalizationEvaluationSummaries;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFrameworkFailure:(BOOL)a3;
- (void)setMetadataLists:(id)a3;
- (void)setModelEvaluationSummaries:(id)a3;
- (void)setModelInformationLists:(id)a3;
- (void)setPersonalizationEvaluationSummaries:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerReport

- (void)clearModelInformationLists
{
}

- (void)addModelInformationList:(id)a3
{
  id v4 = a3;
  modelInformationLists = self->_modelInformationLists;
  id v8 = v4;
  if (!modelInformationLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_modelInformationLists;
    self->_modelInformationLists = v6;

    id v4 = v8;
    modelInformationLists = self->_modelInformationLists;
  }
  [(NSMutableArray *)modelInformationLists addObject:v4];
}

- (unint64_t)modelInformationListsCount
{
  return [(NSMutableArray *)self->_modelInformationLists count];
}

- (id)modelInformationListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_modelInformationLists objectAtIndex:a3];
}

+ (Class)modelInformationListType
{
  return (Class)objc_opt_class();
}

- (void)clearMetadataLists
{
}

- (void)addMetadataList:(id)a3
{
  id v4 = a3;
  metadataLists = self->_metadataLists;
  id v8 = v4;
  if (!metadataLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_metadataLists;
    self->_metadataLists = v6;

    id v4 = v8;
    metadataLists = self->_metadataLists;
  }
  [(NSMutableArray *)metadataLists addObject:v4];
}

- (unint64_t)metadataListsCount
{
  return [(NSMutableArray *)self->_metadataLists count];
}

- (id)metadataListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_metadataLists objectAtIndex:a3];
}

+ (Class)metadataListType
{
  return (Class)objc_opt_class();
}

- (void)clearModelEvaluationSummaries
{
}

- (void)addModelEvaluationSummaries:(id)a3
{
  id v4 = a3;
  modelEvaluationSummaries = self->_modelEvaluationSummaries;
  id v8 = v4;
  if (!modelEvaluationSummaries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_modelEvaluationSummaries;
    self->_modelEvaluationSummaries = v6;

    id v4 = v8;
    modelEvaluationSummaries = self->_modelEvaluationSummaries;
  }
  [(NSMutableArray *)modelEvaluationSummaries addObject:v4];
}

- (unint64_t)modelEvaluationSummariesCount
{
  return [(NSMutableArray *)self->_modelEvaluationSummaries count];
}

- (id)modelEvaluationSummariesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_modelEvaluationSummaries objectAtIndex:a3];
}

+ (Class)modelEvaluationSummariesType
{
  return (Class)objc_opt_class();
}

- (void)clearPersonalizationEvaluationSummaries
{
}

- (void)addPersonalizationEvaluationSummaries:(id)a3
{
  id v4 = a3;
  personalizationEvaluationSummaries = self->_personalizationEvaluationSummaries;
  id v8 = v4;
  if (!personalizationEvaluationSummaries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_personalizationEvaluationSummaries;
    self->_personalizationEvaluationSummaries = v6;

    id v4 = v8;
    personalizationEvaluationSummaries = self->_personalizationEvaluationSummaries;
  }
  [(NSMutableArray *)personalizationEvaluationSummaries addObject:v4];
}

- (unint64_t)personalizationEvaluationSummariesCount
{
  return [(NSMutableArray *)self->_personalizationEvaluationSummaries count];
}

- (id)personalizationEvaluationSummariesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_personalizationEvaluationSummaries objectAtIndex:a3];
}

+ (Class)personalizationEvaluationSummariesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerReport;
  id v4 = [(ODCurareReportFillerReport *)&v8 description];
  v5 = [(ODCurareReportFillerReport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_modelInformationLists count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_modelInformationLists, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v5 = self->_modelInformationLists;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v48 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v47 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"modelInformationList"];
  }
  if ([(NSMutableArray *)self->_metadataLists count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_metadataLists, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v12 = self->_metadataLists;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v43 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"metadataList"];
  }
  if ([(NSMutableArray *)self->_modelEvaluationSummaries count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_modelEvaluationSummaries, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v19 = self->_modelEvaluationSummaries;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v39 + 1) + 8 * k) dictionaryRepresentation];
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"modelEvaluationSummaries"];
  }
  if ([(NSMutableArray *)self->_personalizationEvaluationSummaries count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_personalizationEvaluationSummaries, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v26 = self->_personalizationEvaluationSummaries;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * m), "dictionaryRepresentation", (void)v35);
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"personalizationEvaluationSummaries"];
  }
  v32 = objc_msgSend(NSNumber, "numberWithBool:", self->_frameworkFailure, (void)v35);
  [v3 setObject:v32 forKey:@"frameworkFailure"];

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v3 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v5 = self->_modelInformationLists;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v10 = self->_metadataLists;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_modelEvaluationSummaries;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v20 = self->_personalizationEvaluationSummaries;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  PBDataWriterWriteBOOLField();
  if (!self->_bundleIdentifier) {
    -[ODCurareReportFillerReport writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  uint64_t v20 = a3;
  if ([(ODCurareReportFillerReport *)self modelInformationListsCount])
  {
    [v20 clearModelInformationLists];
    unint64_t v4 = [(ODCurareReportFillerReport *)self modelInformationListsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ODCurareReportFillerReport *)self modelInformationListAtIndex:i];
        [v20 addModelInformationList:v7];
      }
    }
  }
  if ([(ODCurareReportFillerReport *)self metadataListsCount])
  {
    [v20 clearMetadataLists];
    unint64_t v8 = [(ODCurareReportFillerReport *)self metadataListsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ODCurareReportFillerReport *)self metadataListAtIndex:j];
        [v20 addMetadataList:v11];
      }
    }
  }
  if ([(ODCurareReportFillerReport *)self modelEvaluationSummariesCount])
  {
    [v20 clearModelEvaluationSummaries];
    unint64_t v12 = [(ODCurareReportFillerReport *)self modelEvaluationSummariesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(ODCurareReportFillerReport *)self modelEvaluationSummariesAtIndex:k];
        [v20 addModelEvaluationSummaries:v15];
      }
    }
  }
  if ([(ODCurareReportFillerReport *)self personalizationEvaluationSummariesCount])
  {
    [v20 clearPersonalizationEvaluationSummaries];
    unint64_t v16 = [(ODCurareReportFillerReport *)self personalizationEvaluationSummariesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(ODCurareReportFillerReport *)self personalizationEvaluationSummariesAtIndex:m];
        [v20 addPersonalizationEvaluationSummaries:v19];
      }
    }
  }
  v20[48] = self->_frameworkFailure;
  [v20 setBundleIdentifier:self->_bundleIdentifier];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v6 = self->_modelInformationLists;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addModelInformationList:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v8);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v12 = self->_metadataLists;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v16) copyWithZone:a3];
        [(id)v5 addMetadataList:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v14);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v18 = self->_modelEvaluationSummaries;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v22) copyWithZone:a3];
        [(id)v5 addModelEvaluationSummaries:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v20);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v24 = self->_personalizationEvaluationSummaries;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v34;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v28), "copyWithZone:", a3, (void)v33);
        [(id)v5 addPersonalizationEvaluationSummaries:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v26);
  }

  *(unsigned char *)(v5 + 48) = self->_frameworkFailure;
  uint64_t v30 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  long long v31 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  modelInformationLists = self->_modelInformationLists;
  if ((unint64_t)modelInformationLists | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](modelInformationLists, "isEqual:")) {
      goto LABEL_15;
    }
  }
  metadataLists = self->_metadataLists;
  if ((unint64_t)metadataLists | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](metadataLists, "isEqual:")) {
      goto LABEL_15;
    }
  }
  modelEvaluationSummaries = self->_modelEvaluationSummaries;
  if ((unint64_t)modelEvaluationSummaries | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](modelEvaluationSummaries, "isEqual:")) {
      goto LABEL_15;
    }
  }
  personalizationEvaluationSummaries = self->_personalizationEvaluationSummaries;
  if ((unint64_t)personalizationEvaluationSummaries | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](personalizationEvaluationSummaries, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (self->_frameworkFailure)
  {
    if (*((unsigned char *)v4 + 48)) {
      goto LABEL_12;
    }
LABEL_15:
    char v10 = 0;
    goto LABEL_16;
  }
  if (*((unsigned char *)v4 + 48)) {
    goto LABEL_15;
  }
LABEL_12:
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1)) {
    char v10 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_modelInformationLists hash];
  uint64_t v4 = [(NSMutableArray *)self->_metadataLists hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_modelEvaluationSummaries hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_personalizationEvaluationSummaries hash];
  uint64_t v7 = 2654435761 * self->_frameworkFailure;
  return v6 ^ [(NSString *)self->_bundleIdentifier hash] ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ODCurareReportFillerReport *)self addModelInformationList:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = *((id *)v4 + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        [(ODCurareReportFillerReport *)self addMetadataList:*(void *)(*((void *)&v33 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = *((id *)v4 + 3);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        [(ODCurareReportFillerReport *)self addModelEvaluationSummaries:*(void *)(*((void *)&v29 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = *((id *)v4 + 5);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[ODCurareReportFillerReport addPersonalizationEvaluationSummaries:](self, "addPersonalizationEvaluationSummaries:", *(void *)(*((void *)&v25 + 1) + 8 * m), (void)v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  self->_frameworkFailure = *((unsigned char *)v4 + 48);
  if (*((void *)v4 + 1)) {
    -[ODCurareReportFillerReport setBundleIdentifier:](self, "setBundleIdentifier:");
  }
}

- (NSMutableArray)modelInformationLists
{
  return self->_modelInformationLists;
}

- (void)setModelInformationLists:(id)a3
{
}

- (NSMutableArray)metadataLists
{
  return self->_metadataLists;
}

- (void)setMetadataLists:(id)a3
{
}

- (NSMutableArray)modelEvaluationSummaries
{
  return self->_modelEvaluationSummaries;
}

- (void)setModelEvaluationSummaries:(id)a3
{
}

- (NSMutableArray)personalizationEvaluationSummaries
{
  return self->_personalizationEvaluationSummaries;
}

- (void)setPersonalizationEvaluationSummaries:(id)a3
{
}

- (BOOL)frameworkFailure
{
  return self->_frameworkFailure;
}

- (void)setFrameworkFailure:(BOOL)a3
{
  self->_frameworkFailure = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationEvaluationSummaries, 0);
  objc_storeStrong((id *)&self->_modelInformationLists, 0);
  objc_storeStrong((id *)&self->_modelEvaluationSummaries, 0);
  objc_storeStrong((id *)&self->_metadataLists, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerReport writeTo:]", "ODCurareReportFillerReport.m", 323, "nil != self->_bundleIdentifier");
}

@end