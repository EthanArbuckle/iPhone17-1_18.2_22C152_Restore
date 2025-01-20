@interface ODCurareCandidateModel
- (BMStoreStream)BMModelDataStream;
- (BOOL)hasStreamFilter;
- (BOOL)isDefaultModel;
- (BOOL)isPersonalizableModel;
- (MLModelConfiguration)modelConfiguration;
- (NSString)BMModelDataStreamIdentifier;
- (NSString)CDModelDataStreamIdentifier;
- (NSString)modelTag;
- (NSURL)modelURL;
- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStream:(id)a4 andMetadata:(id)a5;
- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStream:(id)a4 withBiomeStreamIdentifier:(id)a5 withModelTag:(id)a6 andMetadata:(id)a7;
- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStreamIdentifier:(id)a4 andMetadata:(id)a5;
- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStream:(id)a4 withCoreDuetStreamIdentifier:(id)a5 andMetadata:(id)a6;
- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStream:(id)a4 withCoreDuetStreamIdentifier:(id)a5 withModelTag:(id)a6 andMetadata:(id)a7;
- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStreamIdentifier:(id)a4 andMetadata:(id)a5;
- (_DKKnowledgeQuerying)CDModelDataStream;
- (id)CDQuery;
- (id)bmReceiveInputBlock;
- (id)description;
- (id)getDatesOfEventsForStream;
- (void)_setBiomeFilter:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6;
- (void)_setCoreDuetQuery:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6;
- (void)setBMModelDataStream:(id)a3;
- (void)setBMModelDataStreamIdentifier:(id)a3;
- (void)setBmReceiveInputBlock:(id)a3;
- (void)setCDModelDataStream:(id)a3;
- (void)setCDModelDataStreamIdentifier:(id)a3;
- (void)setCDQuery:(id)a3;
- (void)setIsDefaultModel:(BOOL)a3;
- (void)setIsPersonalizableModel:(BOOL)a3;
- (void)setModelConfiguration:(id)a3;
- (void)setModelTag:(id)a3;
- (void)setModelURL:(id)a3;
- (void)setStreamFilter:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6;
@end

@implementation ODCurareCandidateModel

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStream:(id)a4 andMetadata:(id)a5
{
  return [(ODCurareCandidateModel *)self initWithModelURL:a3 withBiomeStream:a4 withBiomeStreamIdentifier:0 withModelTag:0 andMetadata:a5];
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStreamIdentifier:(id)a4 andMetadata:(id)a5
{
  return [(ODCurareCandidateModel *)self initWithModelURL:a3 withBiomeStream:0 withBiomeStreamIdentifier:a4 withModelTag:0 andMetadata:a5];
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStreamIdentifier:(id)a4 andMetadata:(id)a5
{
  return [(ODCurareCandidateModel *)self initWithModelURL:a3 withCoreDuetStream:0 withCoreDuetStreamIdentifier:a4 withModelTag:0 andMetadata:a5];
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStream:(id)a4 withCoreDuetStreamIdentifier:(id)a5 andMetadata:(id)a6
{
  return [(ODCurareCandidateModel *)self initWithModelURL:a3 withCoreDuetStream:a4 withCoreDuetStreamIdentifier:0 withModelTag:0 andMetadata:a6];
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStream:(id)a4 withBiomeStreamIdentifier:(id)a5 withModelTag:(id)a6 andMetadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(ODCurareCandidateModel *)self init];
  v18 = v17;
  if (v17)
  {
    [(ODCurareCandidateModel *)v17 setModelTag:v15];
    [(ODCurareCandidateModel *)v18 setModelURL:v12];
    [(ODCurareCandidateModel *)v18 setModelConfiguration:v16];
    [(ODCurareCandidateModel *)v18 setBMModelDataStream:v13];
    [(ODCurareCandidateModel *)v18 setBMModelDataStreamIdentifier:v14];
    [(ODCurareCandidateModel *)v18 setCDModelDataStream:0];
    [(ODCurareCandidateModel *)v18 setCDModelDataStreamIdentifier:0];
  }

  return v18;
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStream:(id)a4 withCoreDuetStreamIdentifier:(id)a5 withModelTag:(id)a6 andMetadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(ODCurareCandidateModel *)self init];
  v18 = v17;
  if (v17)
  {
    [(ODCurareCandidateModel *)v17 setModelTag:v15];
    [(ODCurareCandidateModel *)v18 setModelURL:v12];
    [(ODCurareCandidateModel *)v18 setModelConfiguration:v16];
    [(ODCurareCandidateModel *)v18 setBMModelDataStream:0];
    [(ODCurareCandidateModel *)v18 setBMModelDataStreamIdentifier:0];
    [(ODCurareCandidateModel *)v18 setCDModelDataStream:v13];
    [(ODCurareCandidateModel *)v18 setCDModelDataStreamIdentifier:v14];
  }

  return v18;
}

- (id)getDatesOfEventsForStream
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(ODCurareCandidateModel *)self BMModelDataStream];
  if (v4)
  {

LABEL_4:
    v6 = [(ODCurareCandidateModel *)self bmReceiveInputBlock];

    if (v6)
    {
      v7 = [(ODCurareCandidateModel *)self BMModelDataStream];

      if (!v7)
      {
        id v8 = objc_alloc(MEMORY[0x263F2A990]);
        v9 = [(ODCurareCandidateModel *)self BMModelDataStreamIdentifier];
        v10 = (void *)[v8 initWithPrivateStreamIdentifier:v9 storeConfig:0];
        [(ODCurareCandidateModel *)self setBMModelDataStream:v10];
      }
      v11 = [(ODCurareCandidateModel *)self BMModelDataStream];
      id v12 = [v11 publisher];

      id v13 = [(ODCurareCandidateModel *)self bmReceiveInputBlock];
      id v14 = [v12 filterWithIsIncluded:v13];

      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __51__ODCurareCandidateModel_getDatesOfEventsForStream__block_invoke_2;
      v42[3] = &unk_264C5D898;
      id v15 = v3;
      id v43 = v15;
      id v16 = (id)[v14 sinkWithCompletion:&__block_literal_global receiveInput:v42];
      id v17 = v15;

      goto LABEL_10;
    }
    NSLog(&cfstr_Odcurarecandid.isa);
LABEL_9:
    id v17 = 0;
    goto LABEL_10;
  }
  v5 = [(ODCurareCandidateModel *)self BMModelDataStreamIdentifier];

  if (v5) {
    goto LABEL_4;
  }
  v19 = [(ODCurareCandidateModel *)self CDModelDataStreamIdentifier];

  if (!v19)
  {
    NSLog(&cfstr_Odcurarecandid_2.isa);
    goto LABEL_9;
  }
  v20 = [(ODCurareCandidateModel *)self CDQuery];

  if (!v20)
  {
    NSLog(&cfstr_Odcurarecandid_0.isa);
    goto LABEL_9;
  }
  v35 = [MEMORY[0x263F350B8] knowledgeStore];
  uint64_t v21 = 0;
  int v22 = 0;
  while (1)
  {
    v23 = (void *)MEMORY[0x237DE4870]();
    v24 = [(ODCurareCandidateModel *)self CDQuery];
    v25 = (void *)[v24 copy];

    [v25 setLimit:20];
    [v25 setOffset:v21];
    id v41 = 0;
    v26 = [v35 executeQuery:v25 error:&v41];
    id v27 = v41;
    if (v27)
    {
      v34 = v27;
      NSLog(&cfstr_Odcurarecandid_1.isa, v27);

      id v17 = 0;
      goto LABEL_32;
    }
    if (![v26 count]) {
      break;
    }
    context = v23;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v26;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v37 + 1) + 8 * i) startDate];
          [v3 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v30);
    }

    ++v22;
    v21 += 20;
    if (v22 == 100001) {
      goto LABEL_31;
    }
  }

LABEL_31:
  id v17 = v3;
LABEL_32:

LABEL_10:
  return v17;
}

void __51__ODCurareCandidateModel_getDatesOfEventsForStream__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFF910];
  [a2 timestamp];
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

- (void)setStreamFilter:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(ODCurareCandidateModel *)self BMModelDataStream];
  if (v13)
  {

LABEL_4:
    [(ODCurareCandidateModel *)self _setBiomeFilter:v17 fromInclusive:v10 toDate:v11 toInclusive:v12];
    goto LABEL_5;
  }
  id v14 = [(ODCurareCandidateModel *)self BMModelDataStreamIdentifier];

  if (v14) {
    goto LABEL_4;
  }
  id v15 = [(ODCurareCandidateModel *)self CDModelDataStream];
  if (v15)
  {

LABEL_11:
    [(ODCurareCandidateModel *)self _setCoreDuetQuery:v17 fromInclusive:v10 toDate:v11 toInclusive:v12];
    goto LABEL_5;
  }
  id v16 = [(ODCurareCandidateModel *)self CDModelDataStreamIdentifier];

  if (v16) {
    goto LABEL_11;
  }
  NSLog(&cfstr_Odcurarecandid_3.isa);
LABEL_5:
}

- (BOOL)hasStreamFilter
{
  v3 = [(ODCurareCandidateModel *)self bmReceiveInputBlock];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(ODCurareCandidateModel *)self CDQuery];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)_setBiomeFilter:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_opt_new();
  id v15 = [NSNumber numberWithLong:-1];
  [v14 addObject:v15];

  id v16 = objc_opt_new();
  id v17 = [NSNumber numberWithLong:1];
  [v16 addObject:v17];

  if (v11 && [v11 BOOLValue])
  {
    v18 = [NSNumber numberWithLong:0];
    [v14 addObject:v18];
  }
  if (v13 && [v13 BOOLValue])
  {
    v19 = [NSNumber numberWithLong:0];
    [v16 addObject:v19];
  }
  if (v10 && v12)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke;
    v27[3] = &unk_264C5D8C0;
    id v28 = v10;
    id v29 = v12;
    id v30 = v14;
    id v31 = v16;
    [(ODCurareCandidateModel *)self setBmReceiveInputBlock:v27];

    v20 = v28;
  }
  else if (v10)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_2;
    v24[3] = &unk_264C5D8E8;
    id v25 = v10;
    id v26 = v14;
    [(ODCurareCandidateModel *)self setBmReceiveInputBlock:v24];

    v20 = v25;
  }
  else
  {
    if (!v12)
    {
      NSLog(&cfstr_Odcurarecandid_4.isa);
      [(ODCurareCandidateModel *)self setBmReceiveInputBlock:&__block_literal_global_199];
      goto LABEL_15;
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_3;
    v21[3] = &unk_264C5D8E8;
    id v22 = v12;
    id v23 = v16;
    [(ODCurareCandidateModel *)self setBmReceiveInputBlock:v21];

    v20 = v22;
  }

LABEL_15:
}

BOOL __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke(id *a1, void *a2)
{
  [a2 timestamp];
  v3 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
  BOOL v4 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(a1[4], "compare:", v3));
  v5 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(a1[5], "compare:", v3));
  BOOL v6 = [a1[6] containsObject:v4] && (objc_msgSend(a1[7], "containsObject:", v5) & 1) != 0;

  return v6;
}

uint64_t __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 timestamp];
  v3 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
  BOOL v4 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(*(id *)(a1 + 32), "compare:", v3));
  uint64_t v5 = [*(id *)(a1 + 40) containsObject:v4];

  return v5;
}

uint64_t __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 timestamp];
  v3 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
  BOOL v4 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(*(id *)(a1 + 32), "compare:", v3));
  uint64_t v5 = [*(id *)(a1 + 40) containsObject:v4];

  return v5;
}

uint64_t __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_4()
{
  return 1;
}

- (void)_setCoreDuetQuery:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6
{
  v25[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_opt_new();
  id v15 = [(ODCurareCandidateModel *)self CDModelDataStreamIdentifier];

  if (v15)
  {
    NSLog(&cfstr_Odcurarecandid_6.isa, v10, v11, v12, v13);
    id v16 = (void *)MEMORY[0x263F35098];
    id v17 = [(ODCurareCandidateModel *)self CDModelDataStreamIdentifier];
    v18 = [v16 eventStreamWithName:v17];

    v25[0] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    [v14 setEventStreams:v19];

    if (v10 && v12)
    {
      if (v11)
      {
        int v20 = [v11 BOOLValue];
        if (v13 && v20 && [v13 BOOLValue])
        {
          [MEMORY[0x263F08A98] predicateWithFormat:@"((startDate >= %@) AND (startDate <= %@))", v10, v12];
          goto LABEL_26;
        }
        if ([v11 BOOLValue])
        {
          [MEMORY[0x263F08A98] predicateWithFormat:@"((startDate >= %@) AND (startDate < %@))", v10, v12];
          goto LABEL_26;
        }
      }
      if (v13 && [v13 BOOLValue]) {
        [MEMORY[0x263F08A98] predicateWithFormat:@"((startDate > %@) AND (startDate <= %@))", v10, v12];
      }
      else {
        [MEMORY[0x263F08A98] predicateWithFormat:@"((startDate > %@) AND (startDate < %@))", v10, v12];
      }
      goto LABEL_26;
    }
    if (v10)
    {
      if (v11 && [v11 BOOLValue]) {
        [MEMORY[0x263F08A98] predicateWithFormat:@"(startDate >= %@)", v10, v24];
      }
      else {
        [MEMORY[0x263F08A98] predicateWithFormat:@"(startDate > %@)", v10, v24];
      }
    }
    else
    {
      if (!v12)
      {
        NSLog(&cfstr_Odcurarecandid_4.isa);
        [v14 setPredicate:0];
        goto LABEL_27;
      }
      if (v13 && [v13 BOOLValue]) {
        [MEMORY[0x263F08A98] predicateWithFormat:@"(startDate <= %@)", v12, v24];
      }
      else {
        [MEMORY[0x263F08A98] predicateWithFormat:@"(startDate < %@)", v12, v24];
      }
    }
    uint64_t v21 = LABEL_26:;
    [v14 setPredicate:v21];

LABEL_27:
    id v22 = [v14 predicate];
    id v23 = [v22 predicateFormat];
    NSLog(&cfstr_Odcurarecandid_7.isa, v23);

    [(ODCurareCandidateModel *)self setCDQuery:v14];
    goto LABEL_28;
  }
  NSLog(&cfstr_Odcurarecandid_5.isa);
LABEL_28:
}

- (id)description
{
  if ([(ODCurareCandidateModel *)self isDefaultModel]) {
    v3 = @"default";
  }
  else {
    v3 = @"not_default";
  }
  BOOL v4 = NSString;
  uint64_t v5 = [(ODCurareCandidateModel *)self modelURL];
  BOOL v6 = [(ODCurareCandidateModel *)self modelTag];
  v7 = [v4 stringWithFormat:@"ODCurareCandidateModel. modelURL: %@, modelTag: %@, isDefault: %@", v5, v6, v3];

  return v7;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (NSString)modelTag
{
  return self->_modelTag;
}

- (void)setModelTag:(id)a3
{
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (void)setModelConfiguration:(id)a3
{
}

- (BOOL)isDefaultModel
{
  return self->_isDefaultModel;
}

- (void)setIsDefaultModel:(BOOL)a3
{
  self->_isDefaultModel = a3;
}

- (BOOL)isPersonalizableModel
{
  return self->_isPersonalizableModel;
}

- (void)setIsPersonalizableModel:(BOOL)a3
{
  self->_isPersonalizableModel = a3;
}

- (BMStoreStream)BMModelDataStream
{
  return self->_BMModelDataStream;
}

- (void)setBMModelDataStream:(id)a3
{
}

- (NSString)BMModelDataStreamIdentifier
{
  return self->_BMModelDataStreamIdentifier;
}

- (void)setBMModelDataStreamIdentifier:(id)a3
{
}

- (id)bmReceiveInputBlock
{
  return self->_bmReceiveInputBlock;
}

- (void)setBmReceiveInputBlock:(id)a3
{
}

- (_DKKnowledgeQuerying)CDModelDataStream
{
  return self->_CDModelDataStream;
}

- (void)setCDModelDataStream:(id)a3
{
}

- (NSString)CDModelDataStreamIdentifier
{
  return self->_CDModelDataStreamIdentifier;
}

- (void)setCDModelDataStreamIdentifier:(id)a3
{
}

- (id)CDQuery
{
  return self->_CDQuery;
}

- (void)setCDQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_CDQuery, 0);
  objc_storeStrong((id *)&self->_CDModelDataStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_CDModelDataStream, 0);
  objc_storeStrong(&self->_bmReceiveInputBlock, 0);
  objc_storeStrong((id *)&self->_BMModelDataStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_BMModelDataStream, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_modelTag, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end