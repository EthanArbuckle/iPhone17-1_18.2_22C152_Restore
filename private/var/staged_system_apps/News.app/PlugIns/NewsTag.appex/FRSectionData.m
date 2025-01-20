@interface FRSectionData
- (FRSectionData)initWithName:(id)a3;
- (NSString)sectionName;
- (void)setSectionName:(id)a3;
@end

@implementation FRSectionData

- (FRSectionData)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRSectionData;
  v6 = [(FRSectionData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sectionName, a3);
  }

  return v7;
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (void)setSectionName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end