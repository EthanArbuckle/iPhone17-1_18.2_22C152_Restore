@interface CNVCardLineGenerator
+ (id)activityAlertGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4;
+ (id)alternateDateComponentsGeneratorWithName:(id)a3 groupingcount:(int64_t *)a4;
+ (id)dateComponentsGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4;
+ (id)emailGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4;
+ (id)generatorWithName:(id)a3 groupingCount:(int64_t *)a4;
+ (id)instantMessagingGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4;
+ (id)legacyInstantMessagingGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4;
+ (id)phoneGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4;
+ (id)socialProfileGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4;
+ (id)streetAddressGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4;
- (CNVCardLineGenerator)initWithName:(id)a3 groupingCount:(int64_t *)a4;
- (id)lineWithValue:(id)a3 label:(id)a4;
- (id)makeLineWithName:(id)a3 value:(id)a4;
- (id)standardLabelsForLabel:(id)a3;
- (void)addCustomLabel:(id)a3 toLine:(id)a4;
- (void)addPrimaryValueMarkerToLine:(id)a3;
- (void)addStandardLabel:(id)a3 toLine:(id)a4;
@end

@implementation CNVCardLineGenerator

+ (id)generatorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithName:v6 groupingCount:a4];

  return v7;
}

+ (id)dateComponentsGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

+ (id)alternateDateComponentsGeneratorWithName:(id)a3 groupingcount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

+ (id)instantMessagingGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

+ (id)legacyInstantMessagingGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

+ (id)socialProfileGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

+ (id)emailGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

+ (id)phoneGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

+ (id)streetAddressGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

+ (id)activityAlertGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:a3 groupingCount:a4];
}

- (CNVCardLineGenerator)initWithName:(id)a3 groupingCount:(int64_t *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNVCardLineGenerator;
  v7 = [(CNVCardLineGenerator *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    lineName = v7->_lineName;
    v7->_lineName = (NSString *)v8;

    v7->_groupingCount = a4;
    uint64_t v10 = +[CNVCardLineFactory version30LineFactory];
    lineFactory = v7->_lineFactory;
    v7->_lineFactory = (CNVCardLineFactory *)v10;

    v12 = v7;
  }

  return v7;
}

- (id)lineWithValue:(id)a3 label:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    a3 = [(CNVCardLineGenerator *)self makeLineWithName:self->_lineName value:a3];
    v7 = [(CNVCardLineGenerator *)self standardLabelsForLabel:v6];
    if ([v7 count])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            -[CNVCardLineGenerator addStandardLabel:toLine:](self, "addStandardLabel:toLine:", *(void *)(*((void *)&v14 + 1) + 8 * i), a3, (void)v14);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }
    }
    else if (v6)
    {
      [(CNVCardLineGenerator *)self addCustomLabel:v6 toLine:a3];
    }
  }
  return a3;
}

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [(CNVCardLineFactory *)self->_lineFactory stringLineWithName:v6 value:v7];
  }

  return v8;
}

- (id)standardLabelsForLabel:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"_$!<Work>!$_"])
  {
    v8[0] = @"WORK";
    v4 = (__CFString **)v8;
LABEL_5:
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"_$!<Home>!$_"])
  {
    id v7 = @"HOME";
    v4 = &v7;
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (void)addStandardLabel:(id)a3 toLine:(id)a4
{
}

- (void)addCustomLabel:(id)a3 toLine:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6 && ([v8 isEqualToString:&stru_1F362EAE0] & 1) == 0)
  {
    id v7 = [(CNVCardLineFactory *)self->_lineFactory stringLineWithName:@"X-ABLabel" value:v8];
    [v6 addGroupedLine:v7 withCounter:self->_groupingCount];
  }
}

- (void)addPrimaryValueMarkerToLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineFactory, 0);
  objc_storeStrong((id *)&self->_lineName, 0);
}

@end