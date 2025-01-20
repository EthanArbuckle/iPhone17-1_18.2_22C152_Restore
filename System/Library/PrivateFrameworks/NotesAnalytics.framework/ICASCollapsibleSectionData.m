@interface ICASCollapsibleSectionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollapsibleSectionData)initWithSectionAffordanceExposures:(id)a3 sectionAffordanceUsages:(id)a4;
- (NSNumber)sectionAffordanceExposures;
- (NSNumber)sectionAffordanceUsages;
- (id)toDict;
@end

@implementation ICASCollapsibleSectionData

- (ICASCollapsibleSectionData)initWithSectionAffordanceExposures:(id)a3 sectionAffordanceUsages:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASCollapsibleSectionData;
  v9 = [(ICASCollapsibleSectionData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionAffordanceExposures, a3);
    objc_storeStrong((id *)&v10->_sectionAffordanceUsages, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"CollapsibleSectionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"sectionAffordanceExposures";
  v3 = [(ICASCollapsibleSectionData *)self sectionAffordanceExposures];
  if (v3)
  {
    uint64_t v4 = [(ICASCollapsibleSectionData *)self sectionAffordanceExposures];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"sectionAffordanceUsages";
  v12[0] = v4;
  v6 = [(ICASCollapsibleSectionData *)self sectionAffordanceUsages];
  if (v6)
  {
    uint64_t v7 = [(ICASCollapsibleSectionData *)self sectionAffordanceUsages];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSNumber)sectionAffordanceExposures
{
  return self->_sectionAffordanceExposures;
}

- (NSNumber)sectionAffordanceUsages
{
  return self->_sectionAffordanceUsages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionAffordanceUsages, 0);
  objc_storeStrong((id *)&self->_sectionAffordanceExposures, 0);
}

@end