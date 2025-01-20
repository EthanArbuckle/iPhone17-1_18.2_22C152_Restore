@interface CNVCardEmailLineGenerator
- (id)lineWithValue:(id)a3 label:(id)a4;
- (id)standardLabelsForLabel:(id)a3;
@end

@implementation CNVCardEmailLineGenerator

- (id)lineWithValue:(id)a3 label:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CNVCardEmailLineGenerator;
  v4 = [(CNVCardLineGenerator *)&v6 lineWithValue:a3 label:a4];
  [v4 insertParameterWithName:@"type" value:@"INTERNET" atIndex:0];
  return v4;
}

- (id)standardLabelsForLabel:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"MobileMe"])
  {
    v9[0] = @"MOBILEME";
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNVCardEmailLineGenerator;
    uint64_t v5 = [(CNVCardLineGenerator *)&v8 standardLabelsForLabel:v4];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

@end